# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-scramp
pkgver=1.2.0
pkgrel=3
pkgdesc="Python implementation of the SCRAM protocol"
arch=(any)
url='https://github.com/tlocke/scramp'
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(https://github.com/tlocke/scramp/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('f8ddf442a0e7e3b3bb4d811da80ec6400e36819b4bc283b8227f76ab90eedf2b')

build() {
  cd scramp-$pkgver
  python setup.py build
}

check() {
  cd scramp-$pkgver
  PYTHONPATH=. pytest -v -x tests
}

package() {
  cd scramp-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
