# Maintainer: Asterios Dimitriou <asterios@pci.gr>

pkgname=libqsqlcipher
_pkgver=5.11.2-1
pkgver=5.11.2
pkgrel=1
pkgdesc="Qt5 sqldriver plugin for SQLCipher"
url="https://github.com/sjemens/qsqlcipher-qt5"
license=('LGPL3')
arch=('i686' 'x86_64')
depends=(qt5-base sqlcipher)
source=(qsqlcipher-qt5-${_pkgver}.tar.gz::"https://github.com/sjemens/qsqlcipher-qt5/archive/v${_pkgver}.tar.gz")
sha256sums=('f2a3ad9ccb9aefa55b62acc6b7fd2a16027d80372c8b694009b572b6a104bbac')

build() {
  mkdir -p "${srcdir}/build"
	cd "${srcdir}/build"
	qmake CONFIG+=withTests ../qsqlcipher-qt5-${_pkgver}/qsqlcipher.pro
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
