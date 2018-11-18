# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-pynamodb
_pkgname=PynamoDB
pkgver=3.3.1
pkgrel=1
pkgdesc="A pythonic interface to Amazon's DynamoDB"
arch=(any)
url='https://pynamodb.readthedocs.io/'
license=(MIT)
makedepends=(python-setuptools)
depends=(python-botocore python-dateutil python-six)
checkdepends=(python-blinker python-mock python-pytest-mock python-requests)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/pynamodb/PynamoDB/archive/$pkgver.tar.gz")
sha256sums=('999fff6508ef9697958c08d39a456f0f9551193be3a06ab86edfeb42abd7a9d2')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

check() {
  cd $_pkgname-$pkgver
  pytest -v -m 'not ddblocal' pynamodb/tests
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
