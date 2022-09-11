# Maintainer: Asterios Dimitriou <asterios@pci.gr>

pkgname=libqsqlcipher
_pkgver=5.15-4
pkgver=5.15.6
pkgrel=1
pkgdesc="Qt5 sqldriver plugin for SQLCipher"
url="https://github.com/sjemens/qsqlcipher-qt5"
license=('LGPL3')
arch=('i686' 'x86_64')
depends=(qt5-base sqlcipher)
source=(qsqlcipher-qt5-${_pkgver}.tar.gz::"https://github.com/sjemens/qsqlcipher-qt5/archive/v${_pkgver}.tar.gz")
sha256sums=('86822532251b360e04171764ba56622cf4c65af51273ef80fd03de885e6e732d')

build() {
  rm -rf "${srcdir}/build" && mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  QMAKE_CFLAGS="${CFLAGS}" \
  QMAKE_CXXFLAGS="${CXXFLAGS}" \
  qmake ../qsqlcipher-qt5-${_pkgver}/qsqlcipher.pro \
    CONFIG+="system-sqlcipher withTests"
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
