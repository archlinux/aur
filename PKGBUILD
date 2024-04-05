# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-braintree
pkgver=4.28.0
pkgrel=2
pkgdesc="Braintree Python Library"
arch=('any')
url="https://www.braintreepayments.com/docs/python"
license=('MIT')
depends=('python-requests')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/braintree/braintree_python.git#tag=$pkgver")
sha512sums=('5d3f1382bf2eaf9ee2d7539aa22e612e9dce3c43c2eb786aedd94d49cb7087b24f7cff3a1904bb47a7d42fe72bdb61b23925a5e77627027c4ce529de6863aec1')

build() {
  cd braintree_python
  python setup.py build
}

check() {
  cd braintree_python
  python -m unittest discover tests/unit
}

package() {
  cd braintree_python
  python setup.py install -O1 --root="$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
