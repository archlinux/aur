# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=tinytimer
pkgbase='python-tinytimer'
pkgname=('python-tinytimer' 'python2-tinytimer')
pkgver=0.0.0
pkgrel=2
pkgdesc="A tiny benchmarking library for Python"
arch=('any')
url="https://pypi.python.org/pypi/tinytimer"
license=('Apache')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/5c/87/75d3fbe15aabd45d9b70702241787cf1f7f30dd9fabcd9bc89d828c7661d/tinytimer-0.0.0.tar.gz)
sha256sums=('6ad13c8f01ab6094e58081a5367ffc4c5831f2d6b29034d2434d8ae106308fa5')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-tinytimer() {
  depends=('python2')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-tinytimer() {
  depends=('python')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
