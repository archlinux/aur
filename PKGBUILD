# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-braintree
pkgver=3.59.0
pkgrel=1
pkgdesc="Braintree Python Library"
arch=('any')
url="https://www.braintreepayments.com/docs/python"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/braintree/braintree_python/archive/$pkgver.tar.gz")
sha512sums=('209019414392858d4e6ab9893801b82cea58079eb111fcbb73322263228765607c0c0647370f709da0ad9f50e32c1a8f8e4dbe5380469b85a0f9cd306b1e31bb')

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
