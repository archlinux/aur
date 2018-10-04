# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=ordered-set
pkgbase='python-ordered-set'
pkgname=('python-ordered-set' 'python2-ordered-set')
pkgver=3.0.2
pkgrel=1
pkgdesc="Python MutableSet that remembers its order, so that every entry has an index"
arch=('any')
url="https://pypi.python.org/pypi/ordered-set"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz)
sha256sums=('7d292b866fa44f339ac6e624e3d338accfb415ce0a8431595d51990fbdf61d3b')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-ordered-set() {
  depends=('python2')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 MIT-LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-ordered-set() {
  depends=('python')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 MIT-LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
