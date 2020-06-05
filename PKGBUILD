# Maintainer: Asterios Dimitriou <asterios@pci.gr>

pkgname=libqsqlcipher
_pkgver=5.15-1
pkgver=5.15.0
pkgrel=1
pkgdesc="Qt5 sqldriver plugin for SQLCipher"
url="https://github.com/sjemens/qsqlcipher-qt5"
license=('LGPL3')
arch=('i686' 'x86_64')
depends=(qt5-base)
source=(qsqlcipher-qt5-${_pkgver}.tar.gz::"https://github.com/sjemens/qsqlcipher-qt5/archive/v${_pkgver}.tar.gz")
sha256sums=('d9e84408226db8e603a09065905c557b2a0468122d42c8fd4a0abf6c61208471')

build() {
  rm -rf "${srcdir}/build" && mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  QMAKE_CFLAGS="${CFLAGS}" \
  QMAKE_CXXFLAGS="${CXXFLAGS}" \
  qmake ../qsqlcipher-qt5-${_pkgver}/qsqlcipher.pro \
    CONFIG+=withTests
  make
}

check() {
  cd "${srcdir}/build"
  ./tests/qsqlcipher_test
}

package() {
  cd "${srcdir}/build/qsqlcipher"
  make install INSTALL_ROOT="${pkgdir}"
}
