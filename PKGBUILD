# $Id: PKGBUILD 151884 2015-12-10 04:07:37Z foutrelis $
# Maintainer: Peter Vágner <pvdeejay@gmail.com>
# (added from qt-at-spi package)
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor: Kyle <kyle@gmx.ca>

_pkgname=qt-at-spi
pkgname=lib32-$_pkgname
pkgver=0.3.1
pkgrel=1
pkgdesc="A Qt plugin that bridges the QAccessible API’s to the AT-SPI 2 protocol, giving blind and visually impaired users access to qt applications."
arch=(x86_64)
url="http://projects.kde.org/qtatspi"
license=('LGPL')
depends=('lib32-at-spi2-core' 'lib32-qt4>=4.8' 'qt-at-spi')
makedepends=('gcc-multilib' 'git' 'qt4')
options=('!libtool')
source=("git://anongit.kde.org/qtatspi.git#tag=v0.3.1")
md5sums=('SKIP')

prepare() {
	cd qtatspi
	sed -ri "s:(target\.path = ).*:\1/usr/lib32/qt/plugins/accessiblebridge:g" src/src.pro
	sed -i 's/QMAKE_CXXFLAGS.*$/&\nQMAKE_INCDIR_QT=\/usr\/include\/qt4-32/' src/src.pro
}

build() {
	cd qtatspi
	qmake-qt4 -query
	qmake-qt4 -r -spec linux-g++-32
	make
}

check() {
	cd qtatspi
	make -k check
}

package() {
	cd qtatspi
	make INSTALL_ROOT="$pkgdir" install
}
