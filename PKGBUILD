# Maintainer: dreieck
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: cs-cam - me.at.camdaniel.com

## NOTE: DO NOT UPGRADE to version 0.23 or higher, since that in fact will break things for python2. Python2 compatibility only up to version 0.22.

_upstreamname=pybluez
_pkgname="python2-${_upstreamname}"
pkgname="${_pkgname}-0.22"
epoch=0
pkgver=0.22
pkgrel=3
pkgdesc="python2 wrapper for the BlueZ Bluetooth stack. Version 0.22, the probably latest one with python2 support."
arch=(
  'i686'
  'x86_64'
)
url='https://github.com/pybluez/pybluez'
# url="https://pybluez.github.io/"
license=('GPL')
depends=(
  'bluez-libs'
  'python2'
)
makedepends=(
  'python2-setuptools'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_upstreamname}2=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_upstreamname}2"
)
replaces=(
  "${_pkgname}"
)
source=(
  "${_upstreamname}-${pkgver}.tar.gz::https://github.com/pybluez/pybluez/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=(
  '53db881a2668791062985e1ff7afbe6527cdd9af3676a3160420a235bee3c768'
)

prepare() {
  cd "${srcdir}/${_upstreamname}-${pkgver}"

  for _pyfile in *.py; do
    msg2 "Patching shabeng line for python2 in '${_pyfile}' ..."
    sed -E -i '1s|^#!(.*)python$|#!\1python2|' "${_pyfile}"
  done
}

build() {
    cd "${srcdir}/${_upstreamname}-${pkgver}"

    python2 setup.py build
}

package() {
    cd "${srcdir}/${_upstreamname}-${pkgver}"

    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
