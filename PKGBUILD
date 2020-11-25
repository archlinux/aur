# Maintainer: Asterios Dimitriou <asterios@pci.gr>

pkgname=libqsqlcipher
_pkgver=5.15-2
pkgver=5.15.2
pkgrel=1
pkgdesc="Qt5 sqldriver plugin for SQLCipher"
url="https://github.com/sjemens/qsqlcipher-qt5"
license=('LGPL3')
arch=('i686' 'x86_64')
depends=(qt5-base)
source=(qsqlcipher-qt5-${_pkgver}.tar.gz::"https://github.com/sjemens/qsqlcipher-qt5/archive/v${_pkgver}.tar.gz")
sha256sums=('8d259d603a3b24919c5f96beaa0146e4a512028c62bc617a003d42dfa75857f2')

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
