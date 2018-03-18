# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=datrie
pkgbase='python-datrie'
pkgname=('python-datrie' 'python2-datrie')
pkgver=0.7.1
pkgrel=1
pkgdesc="LZ-string compression for Python"
arch=('any')
url="https://pypi.python.org/pypi/datrie"
license=('(L)GPL2')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/44/5f/bf7e4711f6aa95edb2216b3487eeac719645802259643d341668e65636db/datrie-0.7.1.tar.gz)
sha256sums=('7a11371cc2dbbad71d6dfef57ced6e8b384bb377eeb847c63d58f8dc8e8b2023')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-datrie() {
  depends=('python2')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-datrie() {
  depends=('python')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
