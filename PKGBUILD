# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=rabaDB
pkgbase='python-rabadb'
pkgname=('python-rabadb' 'python2-rabadb')
pkgver=1.0.5
pkgrel=2
pkgdesc="Lightweight uncomplicated schemaless ORM on top of sqlite3 for Python"
arch=('any')
url=https://pypi.python.org/pypi/"${_name}"
license=('Apache')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/11/10/e8397c370efd954209089319b3d842a1689499a5b5c20812e5094d32b83f/rabaDB-1.0.5.tar.gz)
sha256sums=('e447a93b6bf22479766ee73533416a30cd6859644854e50c3030285a3d009498')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-rabadb() {
  depends=('python2')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-rabadb() {
  depends=('python')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
