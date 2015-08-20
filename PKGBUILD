# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=greenisland
pkgver=0.5.95
pkgrel=1
pkgdesc="Green Island: Qt-based compositor infrastructure for Wayland"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://hawaiios.org'
license=('GPL', 'LGPL')
depends=('qt5-declarative' 'hawaii-qt5-wayland' 'xkeyboard-config')
conflicts=('greenisland-git')
makedepends=('gdb' 'extra-cmake-modules')
options=('debug')
source=("https://github.com/greenisland/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('2d679c57ef91d0148f7748d1d673a074')

prepare() {
	mkdir build
}

build() {
	cd build
	cmake ../${pkgname}-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DLIBEXEC_INSTALL_DIR=lib \
		-DQML_INSTALL_DIR=lib/qt/qml \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DQtWaylandScanner_EXECUTABLE=/usr/lib/qt/bin/qtwaylandscanner \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
