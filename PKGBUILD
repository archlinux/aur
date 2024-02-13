# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-pynamodb
# https://pynamodb.readthedocs.io/en/latest/release_notes.html
# https://github.com/pynamodb/PynamoDB/releases
pkgver=6.0.1
pkgrel=1
pkgdesc="A pythonic interface to Amazon's DynamoDB"
arch=(any)
url='https://pynamodb.readthedocs.io/'
license=(MIT)
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=(python python-botocore)
checkdepends=(python-blinker python-pytest-env python-pytest-mock python-freezegun)
optdepends=(
  'python-blinker: for signals'
)
source=("https://github.com/pynamodb/PynamoDB/archive/$pkgver/PynamoDB-$pkgver.tar.gz")
sha256sums=('61dedc9b84835ec7a30bd8ada2d3dcae3f0ef8e91b6a0036c3a99d7f51968d67')

build() {
  cd PynamoDB-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd PynamoDB-$pkgver
  pytest -m 'not ddblocal' tests
}

package() {
  cd PynamoDB-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
