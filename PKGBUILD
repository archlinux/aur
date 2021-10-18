# Maintainer: dreieck
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: cs-cam - me.at.camdaniel.com

## NOTE: DO NOT UPGRADE to version 0.23 or higher, since that in fact will break things for python2. Python2 compatibility only up to version 0.22.

_pkgname=pybluez
pkgname=python2-pybluez
epoch=1
pkgver=0.22
pkgrel=1
pkgdesc="python2 wrapper for the BlueZ Bluetooth stack"
arch=(
  'i686'
  'x86_64'
)
url="https://pybluez.github.io/"
license=('GPL')
depends=(
  'bluez-libs'
  'python2'
)
makedepends=(
  'python2-setuptools'
)
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/pybluez/pybluez/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _pyfile in *.py; do
    msg2 "Patching shabeng line for python2 in '${_pyfile}' ..."
    sed -E -i '1s|^#!(.*)python$|#!\1python2|' "${_pyfile}"
  done
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python2 setup.py build
}

package_python2-pybluez() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
