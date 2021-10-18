# Maintainer: dreieck
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: cs-cam - me.at.camdaniel.com

_pkgname=pybluez
pkgname=python2-pybluez
pkgver=0.23
pkgrel=2
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
  '2c5234a27d8bd560c65eee73d0b72e65ddfdf018b256b4eccab0680d577db1d5'
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
