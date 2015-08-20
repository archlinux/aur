# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-braintree
pkgname=(python-braintree python2-braintree)
_pkgname=braintree
pkgver=3.19.0
pkgrel=1
pkgdesc="Braintree Python Library"
arch=('any')
url="https://www.braintreepayments.com/docs/python"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-requests' 'python2-requests')
checkdepends=('python-nose' 'python2-nose')
source=("$pkgbase-$pkgver::https://github.com/braintree/braintree_python/archive/${pkgver}.tar.gz")
sha512sums=('c0379855cd4f49c06f91a2bfe33b2f0f3f03a95a9cacaa9c4f337172763fdbf4672ac27ad4963e1128945d0df4d7f2a49bb65a97025af34af785181030036461')

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

