# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=polo
pkgbase='python-polo'
pkgname=('python-polo' 'python2-polo')
pkgver=0.5
pkgrel=1
pkgdesc="Python optimal leaf ordering for hierarchical clustering"
arch=('any')
url="https://pypi.python.org/pypi/polo"
license=('MIT')
makedepends=(
  'python' 'python-setuptools' 'cython'
  'python2' 'python2-setuptools' 'cython2')
options=(!emptydirs)
source=(
  "${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/58/cd/cd9950e2584edc24b63944734152092052b20e9b78fe50b3292f402e0652/polo-0.5.tar.gz
  https://raw.githubusercontent.com/adrianveres/polo/7c1fe6893d4874a0097f10c42f4a86c5ca77388e/LICENSE
)
sha256sums=(
  '956e2b7cf7825988f7085616058b985742483d7b7d0634e0e9d3f679a88bc232'
  '1e8c74335e5bc366e844b49f1e9cd551d9eacdc17b94ed7d89cc2bff47cfb651')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

package() {
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-polo() {
  depends=('python2' 'python2-numpy' 'python2-scipy')

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-polo() {
  depends=('python' 'python-numpy' 'python-scipy')

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
