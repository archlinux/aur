# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-braintree
pkgname=(python-braintree python2-braintree)
_pkgname=braintree
pkgver=3.16.0
pkgrel=1
pkgdesc="Braintree Python Library"
arch=('any')
url="https://www.braintreepayments.com/docs/python"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-requests' 'python2-requests')
checkdepends=('python-nose' 'python2-nose')
source=("$pkgbase-$pkgver::https://github.com/braintree/braintree_python/archive/${pkgver}.tar.gz")
sha512sums=('178d845f318a1b6d00b2fe684add03560228501f9e3e863e8491686d4fc4c17e65ec2fe59eca96bee13d16c0cda461ecd9adc4abf6f9aa84092aa0dab7223d58')

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

