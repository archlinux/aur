# Maintainer: Asterios Dimitriou <asterios@pci.gr>

pkgname=libqsqlcipher
_pkgver=5.15-3
pkgver=5.15.2
pkgrel=2
pkgdesc="Qt5 sqldriver plugin for SQLCipher"
url="https://github.com/sjemens/qsqlcipher-qt5"
license=('LGPL3')
arch=('i686' 'x86_64')
depends=(qt5-base)
source=(qsqlcipher-qt5-${_pkgver}.tar.gz::"https://github.com/sjemens/qsqlcipher-qt5/archive/v${_pkgver}.tar.gz")
sha256sums=('0e224abfc680af0f7d49bdac34c5adb9d74f96e559e4507121b66e1ed307dcdc')

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
