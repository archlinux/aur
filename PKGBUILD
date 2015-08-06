# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-terminal
pkgver=0.5.91
pkgrel=1
pkgdesc="The Hawaii Terminal Emulator"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://hawaiios.org/"
license=('GPL2')
depends=('qt5-declarative' 'qt5-quickcontrols')
makedepends=('extra-cmake-modules')
source=("https://github.com/hawaii-desktop/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('4d99b4a0aea19f51199e1273288458b0')

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../${pkgname}-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DLIBEXEC_INSTALL_DIR=lib \
		-DQML_INSTALL_DIR=lib/qt/qml \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DCMAKE_BUILD_TYPE=Release
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
