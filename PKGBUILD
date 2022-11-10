# Maintainer: Thorsten Müller contact@thorko.de
_base=matrix
pkgname=python-${_base}-client-git
pkgdesc="Matrix Client-Server SDK"
pkgver=0.4.0
pkgrel=3
arch=(any)
url="https://github.com/${_base}-org/${_base}-python-sdk"
license=('Apache')
depends=(python-requests)
makedepends=(python-pytest-runner git)
source=(git+${url}.git)
sha256sums=('SKIP')

pkgver() {
  cd ${_base}-python-sdk
  git describe --always | cut -d- -f1-2 | sed -e 's/-/./' -e 's/^[^0-9]*//'
}

build() {
  cd ${_base}-python-sdk
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-python-sdk
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
