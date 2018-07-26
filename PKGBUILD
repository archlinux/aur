# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-braintree
pkgname=(python-braintree python2-braintree)
pkgver=3.47.0
pkgrel=1
pkgdesc="Braintree Python Library"
arch=('any')
url="https://www.braintreepayments.com/docs/python"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-requests' 'python2-requests')
checkdepends=('python-nose' 'python2-nose' 'python2-mock')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/braintree/braintree_python/archive/$pkgver.tar.gz")
sha512sums=('13758cbef063ea09d0eb19bf6d6db34002da890859dcd6a4d9df4af3c4dfff33a03e3a393c0ae586a348e42b450f3460258d53fdca3b465696bbd7c5782de1cb')

prepare() {
  cp -a braintree_python-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/braintree_python-$pkgver
  python setup.py build

  cd "$srcdir"/braintree_python-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/braintree_python-$pkgver
  nosetests3 tests/unit

  cd "$srcdir"/braintree_python-$pkgver-py2
  nosetests2 tests/unit
}

package_python-braintree() {
  depends=('python-requests')

  cd braintree_python-$pkgver
  python setup.py install -O1 --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-braintree() {
  depends=('python2-requests')

  cd braintree_python-$pkgver-py2
  python2 setup.py install -O1 --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
