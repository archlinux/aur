# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-scramp
pkgver=1.1.0
pkgrel=3
pkgdesc="Python implementation of the SCRAM protocol"
arch=(any)
url='https://github.com/tlocke/scramp'
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(https://github.com/tlocke/scramp/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('ca426e7fd186531a933207db3e973e1cf3a8b425c2f14875e061a80ebf62660e')

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
