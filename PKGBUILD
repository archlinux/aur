# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-braintree
pkgver=3.56.0
pkgrel=1
pkgdesc="Braintree Python Library"
arch=('any')
url="https://www.braintreepayments.com/docs/python"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/braintree/braintree_python/archive/$pkgver.tar.gz")
sha512sums=('576b2cb3555db2b43ddc1929302e48b52079619aa29e9bf3dbbc917da68f966ac0b6987a1414876abfd96100fb4d470b7e4fa277e8b6ea9cf6d6880c20c388ed')

build() {
  cd braintree_python-$pkgver
  python setup.py build
}

check() {
  cd braintree_python-$pkgver
  nosetests3 tests/unit
}

package() {
  cd braintree_python-$pkgver
  python setup.py install -O1 --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
