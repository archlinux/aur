# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-pynamodb
_pkgname=PynamoDB
pkgver=3.3.2
pkgrel=1
pkgdesc="A pythonic interface to Amazon's DynamoDB"
arch=(any)
url='https://pynamodb.readthedocs.io/'
license=(MIT)
makedepends=(python-setuptools)
depends=(python-botocore python-dateutil python-six)
checkdepends=(python-blinker python-mock python-pytest-mock python-requests)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/pynamodb/PynamoDB/archive/$pkgver.tar.gz")
sha256sums=('9065613eb25e8951e94e0f10ba7053faf8929cf5582df30166e068a7915bd8de')

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
