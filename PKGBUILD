# Maintainer: Morten Linderud <foxboron@archlinux.org> 
# Contributor: Sean Haugh <seanphaugh@gmail.com>

pkgname=python-pywal
pkgver=3.0.1
pkgrel=1
pkgdesc="Generate and change colorschemes on the fly"
arch=('any')
url="https://github.com/dylanaraps/pywal/"
license=('MIT')
depends=('python' 'imagemagick')
makedepends=('python-setuptools')
optdepends=('feh: set wallpaper'
            'nitrogen: set wallpaper'
	    'python2: reload gtk2 themes on the fly')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dylanaraps/pywal/archive/${pkgver}.tar.gz")
sha256sums=('d0fd3980a0cb47742292231da3da30ba0b57ed17d65b4e6b7359bca1d9f21108')

build(){
  cd "pywal-${pkgver}"
  python setup.py build
}

check(){
  cd "pywal-${pkgver}"
  python setup.py test
}

package() {
  cd "pywal-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
