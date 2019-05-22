# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-braintree
pkgver=3.54.0
pkgrel=1
pkgdesc="Braintree Python Library"
arch=('any')
url="https://www.braintreepayments.com/docs/python"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/braintree/braintree_python/archive/$pkgver.tar.gz")
sha512sums=('a1e3f7c52917adad4ae1854dd86d8c8f0acad071c09b91ccc3f88550ae70177731ea70b237eec7d8ac831437f229c3743b6b4da33535aed4811748b4b2bfbfd1')

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
