# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-braintree
pkgver=3.52.0
pkgrel=1
pkgdesc="Braintree Python Library"
arch=('any')
url="https://www.braintreepayments.com/docs/python"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/braintree/braintree_python/archive/$pkgver.tar.gz")
sha512sums=('953d81c521240fcc94e0690d99fc8495a82cbc59f16440ba610863f6f94abe6a195df65866258356de22d3c0319c78eddd25dd5e4ad78d90a70c43cb80d09ac7')

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
