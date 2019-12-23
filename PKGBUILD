# Maintainer: Asterios Dimitriou <asterios@pci.gr>

pkgname=libqsqlcipher
_pkgver=5.14-1
pkgver=5.14
pkgrel=1
pkgdesc="Qt5 sqldriver plugin for SQLCipher"
url="https://github.com/sjemens/qsqlcipher-qt5"
license=('LGPL3')
arch=('i686' 'x86_64')
depends=(qt5-base sqlcipher)
source=(qsqlcipher-qt5-${_pkgver}.tar.gz::"https://github.com/sjemens/qsqlcipher-qt5/archive/v${_pkgver}.tar.gz")
sha256sums=('54bcde8ba564d504972dd22c342df15c18ccd219b1bcd088563b777bd13d7d26')

build() {
  mkdir -p "${srcdir}/build"
	cd "${srcdir}/build"
	QMAKE_CFLAGS="${CFLAGS}" \
	QMAKE_CXXFLAGS="${CXXFLAGS}" \
	qmake ../qsqlcipher-qt5-${_pkgver}/qsqlcipher.pro \
	  CONFIG+=withTests \
	  DEFINES+=DISABLE_COLUMN_METADATA
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
