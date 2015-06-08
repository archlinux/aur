# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=greenisland
pkgver=0.5.90
pkgrel=1
pkgdesc="Green Island: Qt-based compositor infrastructure for Wayland"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/greenisland/greenisland.git'
license=('GPL', 'LGPL')
depends=('qt5-declarative' 'hawaii-qt5-wayland-git' 'libkscreen-frameworks' 'xkeyboard-config')
conflicts=('greenisland-git')
makedepends=('gdb' 'extra-cmake-modules')
options=('debug')
source=("https://github.com/greenisland/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('5b4c12259f0aafbf823f11db348c7edd')

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
