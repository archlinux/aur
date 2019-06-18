# Maintainer: Asterios Dimitriou <asterios@pci.gr>

pkgname=libqsqlcipher
_pkgver=5.12.4-1
pkgver=5.12.4
pkgrel=1
pkgdesc="Qt5 sqldriver plugin for SQLCipher"
url="https://github.com/sjemens/qsqlcipher-qt5"
license=('LGPL3')
arch=('i686' 'x86_64')
depends=(qt5-base sqlcipher)
source=(qsqlcipher-qt5-${_pkgver}.tar.gz::"https://github.com/sjemens/qsqlcipher-qt5/archive/v${_pkgver}.tar.gz")
sha256sums=('6de6e4a83b52241cd5ed796c0347949822da1ea39110aedfc38359666e8038b6')

build() {
  mkdir -p "${srcdir}/build"
	cd "${srcdir}/build"
	QMAKE_CFLAGS="${CFLAGS}" \
	QMAKE_CXXFLAGS="${CXXFLAGS}" \
	qmake CONFIG+=withTests ../qsqlcipher-qt5-${_pkgver}/qsqlcipher.pro \
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
