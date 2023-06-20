# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgname=mohawk
pkgname=python-mohawk
pkgver=1.1.0
pkgrel=8
pkgdesc='Python library for Hawk HTTP authorization'
arch=('any')
url='https://github.com/kumar303/mohawk'
license=('BSD')
depends=('python-six')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://github.com/kumar303/$_pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz" "use-unittest-mock.patch")
sha256sums=('995ecf009a92efb18a6503707e0c4d9887fe758102d824ca3e5a5625fee1b8bd'
            'aa98c3661aa46218094f645b772bb831500cdd069fd76aec78cf734f4b758445')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ${srcdir}/use-unittest-mock.patch
}

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

check() {
  cd $_pkgname-$pkgver
  nosetests
}

package() {
  cd $_pkgname-$pkgver 
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
