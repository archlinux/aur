# Maintainer: Morten Linderud <foxboron@archlinux.org> 
# Contributor: Sean Haugh <seanphaugh@gmail.com>

pkgname=python-pywal
pkgver=3.3.0
pkgrel=11
pkgdesc="Generate and change colorschemes on the fly"
arch=('any')
url="https://github.com/dylanaraps/pywal/"
license=('MIT')
depends=('python' 'imagemagick')
makedepends=('python-setuptools')
optdepends=('feh: set wallpaper'
            'nitrogen: set wallpaper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dylanaraps/pywal/archive/${pkgver}.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://github.com/dylanaraps/pywal/releases/download/${pkgver}/${pkgver}.tar.gz.asc")
validpgpkeys=("155DC67DC25496572CDD608FF635E931C2834999")
sha256sums=('fe8fc1c29d1cad1a1a8580293dcfe32e1fac259f9dbfd5c8877439fa5948d189'
            'SKIP')

build(){
  cd "pywal-${pkgver}"
  python setup.py build
}

check(){
  cd "pywal-${pkgver}"
  python -m unittest discover -vs tests
}

package() {
  cd "pywal-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
