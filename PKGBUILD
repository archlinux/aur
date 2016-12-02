# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-braintree
pkgname=(python-braintree python2-braintree)
pkgver=3.32.0
pkgrel=1
pkgdesc="Braintree Python Library"
arch=('any')
url="https://www.braintreepayments.com/docs/python"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-requests' 'python2-requests' 'git')
checkdepends=('python-nose' 'python2-nose')
source=("git+https://github.com/braintree/braintree_python.git#tag=$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a braintree_python{,-py2}
}

build() {
  cd "$srcdir"/braintree_python
  python setup.py build

  cd "$srcdir"/braintree_python-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/braintree_python
  nosetests3 tests/unit

  cd "$srcdir"/braintree_python-py2
  nosetests2 tests/unit
}

package_python-braintree() {
  depends=('python-requests')

  cd braintree_python
  python setup.py install -O1 --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-braintree() {
  depends=('python2-requests')

  cd braintree_python-py2
  python2 setup.py install -O1 --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
