# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=greenisland
pkgver=0.7.1
pkgrel=1
pkgdesc="Green Island: Qt-based compositor infrastructure for Wayland"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://hawaiios.org'
license=('GPL2', 'LGPL2.1')
depends=('systemd' 'libdrm' 'libinput' 'qt5-declarative'
         'xkeyboard-config' 'libxkbcommon' 'fontconfig' 'freetype2')
conflicts=('greenisland-git')
makedepends=('gdb' 'extra-cmake-modules' 'xcb-util-cursor' 'libxcursor')
options=('debug')
source=("https://github.com/greenisland/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha1sums=('2142213e8941d529f7fce6fad6a44cd37af3045e')

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
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
