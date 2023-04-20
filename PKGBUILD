# Maintainer: Asterios Dimitriou <asterios@pci.gr>

pkgname=libqsqlcipher
_pkgver=5.15-5
pkgver=5.15.9
pkgrel=1
pkgdesc="Qt5 sqldriver plugin for SQLCipher"
url="https://github.com/sjemens/qsqlcipher-qt5"
license=('LGPL3')
arch=('i686' 'x86_64')
depends=(qt5-base sqlcipher)
source=(qsqlcipher-qt5-${_pkgver}.tar.gz::"https://github.com/sjemens/qsqlcipher-qt5/archive/v${_pkgver}.tar.gz")
sha256sums=('363a9a5b4ab084178a85c77f34134e1f6084c750e576c50ea11c68cc9b46e924')

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
