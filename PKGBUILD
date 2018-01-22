# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=curses-menu
pkgbase='python-curses-menu'
pkgname=('python-curses-menu' 'python2-curses-menu')
pkgver=0.5.0
pkgrel=2
pkgdesc="A simple console menu system using curses in Python"
arch=('any')
url="https://pypi.python.org/pypi/curses-menu"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".zip::https://pypi.python.org/packages/3b/7d/82f1492afd33f92e64d44d51f65eff4c39382642cfced65d5748a770bb8f/curses-menu-0.5.0.zip)
sha256sums=('29c45e2f16283833e2940fac0fd64e948f2ff603d3e11f510c5bd2b946cd8981')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-curses-menu() {
  depends=('python2')
  checkdepends=('python2-tox')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-curses-menu() {
  depends=('python')
  checkdepends=('python-tox')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
