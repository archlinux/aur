# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=logzero
pkgbase='python-logzero'
pkgname=('python-logzero' 'python2-logzero')
pkgver=1.5.0
pkgrel=2
pkgdesc="Robust and effective logging for Python 2 and 3"
arch=('any')
url="https://pypi.python.org/pypi/logzero"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/27/df/a131acda0beb1b38896668c1313d749cdc417cb0b6ea8b7118326602a435/logzero-1.5.0.tar.gz)
sha256sums=('34fa1e2e436dfa9f37e5ff8750e932bafe0c5abbb42e1f669e4cf5ce1f179142')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-logzero() {
  depends=('python2')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-logzero() {
  depends=('python')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
