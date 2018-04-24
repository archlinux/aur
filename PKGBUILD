# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=notifiers
pkgbase='python-notifiers'
pkgname=('python-notifiers' 'python2-notifiers')
pkgver=0.6.4
pkgrel=1
pkgdesc="Python logging library for easily sending notifications"
arch=('any')
url="https://pypi.python.org/pypi/notifiers"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz)
sha256sums=('477c779aa0f58a6e20c574892a0ff8f0bd6e618f730d5ee673af8e731e1abd22')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-notifiers() {
  depends=(
    'python2'
    'python2-click'
    'python2-requests')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-notifiers() {
  depends=(
    'python'
    'python-click'
    'python-requests')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
