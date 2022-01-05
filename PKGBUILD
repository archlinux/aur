# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-pynamodb
# https://pynamodb.readthedocs.io/en/latest/release_notes.html
pkgver=5.2.0
pkgrel=1
pkgdesc="A pythonic interface to Amazon's DynamoDB"
arch=(any)
url='https://pynamodb.readthedocs.io/'
license=(MIT)
makedepends=(python-setuptools)
depends=(python-botocore)
checkdepends=(python-blinker python-pytest-env python-pytest-mock)
optdepends=(
  'python-blinker: for signals'
)
source=("https://github.com/pynamodb/PynamoDB/archive/$pkgver/PynamoDB-$pkgver.tar.gz")
sha256sums=('077bfa2915354048c6eb84cbc819dc25b8b468afb83454ad3a78a61e8acfed1a')

build() {
  cd PynamoDB-$pkgver
  python setup.py build
}

check() {
  cd PynamoDB-$pkgver
  pytest -m 'not ddblocal' tests
}

package() {
  cd PynamoDB-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
