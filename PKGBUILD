# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-pynamodb
_pkgname=PynamoDB
pkgver=3.3.3
pkgrel=1
pkgdesc="A pythonic interface to Amazon's DynamoDB"
arch=(any)
url='https://pynamodb.readthedocs.io/'
license=(MIT)
makedepends=(python-setuptools)
depends=(python-botocore python-dateutil python-six)
checkdepends=(python-blinker python-mock python-pytest-mock python-requests)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/pynamodb/PynamoDB/archive/$pkgver.tar.gz")
sha256sums=('477080bc3e690a42966d0ac0220682ce016eebefabd0cdaf1aa267bd99a58445')

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
