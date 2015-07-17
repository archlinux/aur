# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-braintree
pkgname=(python-braintree python2-braintree)
_pkgname=braintree
pkgver=3.18.0
pkgrel=1
pkgdesc="Braintree Python Library"
arch=('any')
url="https://www.braintreepayments.com/docs/python"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-requests' 'python2-requests')
checkdepends=('python-nose' 'python2-nose')
source=("$pkgbase-$pkgver::https://github.com/braintree/braintree_python/archive/${pkgver}.tar.gz")
sha512sums=('76b01c29e9d179631687a79d138a93a6f556b002f4850c746fded0b0a8aec78bdac20c9e4c47152c15a6505fdf28bea762e42d1fdff7a61a35e4b4237d9e21bf')

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

