# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-braintree
pkgname=(python-braintree python2-braintree)
_pkgname=braintree
pkgver=3.21.0
pkgrel=1
pkgdesc="Braintree Python Library"
arch=('any')
url="https://www.braintreepayments.com/docs/python"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-requests' 'python2-requests')
checkdepends=('python-nose' 'python2-nose')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/braintree/braintree_python/archive/${pkgver}.tar.gz")
sha512sums=('91cc1ba73213466b4866bcc286880e823d6ccf4580c10816c545373d1e6f5f64067861325497e7ada0137804d99294a46b653c5a8ca9bab9cf360371542254ce')

prepare() {
  cp -a ${_pkgname}_python-$pkgver{,-py2}
}

build() {
  cd ${_pkgname}_python-$pkgver
  python setup.py build

  cd ../${_pkgname}_python-$pkgver-py2
  python2 setup.py build
}

check() {
  cd ${_pkgname}_python-$pkgver
  nosetests3 tests/unit

  cd ../${_pkgname}_python-$pkgver-py2
  nosetests2 tests/unit
}

package_python-braintree() {
  depends=('python-requests')

  cd ${_pkgname}_python-$pkgver
  python setup.py install -O1 --root "${pkgdir}"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-braintree() {
  depends=('python2-requests')

  cd ${_pkgname}_python-$pkgver-py2
  python2 setup.py install -O1 --root "${pkgdir}"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

