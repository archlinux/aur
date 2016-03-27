# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=greenisland
pkgver=0.7.90.20160327
pkgrel=1
pkgdesc="Green Island: Qt-based compositor infrastructure for Wayland"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://hawaiios.org'
license=('LGPL3')
depends=('systemd' 'wayland-protocols' 'libdrm' 'libinput' 'qt5-declarative'
         'xkeyboard-config' 'libxkbcommon' 'fontconfig' 'freetype2')
conflicts=('greenisland-git')
makedepends=('gdb' 'extra-cmake-modules' 'xcb-util-cursor' 'libxcursor')
options=('debug')
#source=("https://github.com/greenisland/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
source=("https://codeload.github.com/greenisland/greenisland/legacy.tar.gz/b37dfb679026c0ecee5786b93d3976ae483963d0")
sha1sums=('ffe8aa31ce7616e284d3ce6f885dd3aeb57a69b0')

prepare() {
	mkdir build
}

build() {
	cd build
	#cmake ../${pkgname}-${pkgver} \
	cmake ../greenisland-greenisland-b37dfb6 \
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
