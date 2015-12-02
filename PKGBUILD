# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=libhawaii
pkgver=0.5.90
pkgrel=1
pkgdesc="Hawaii libraries"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://hawaiios.org"
license=('GPL3', 'LGPL3')
depends=('qt5-base' 'qt5-declarative' 'glib2')
makedepends=('gdb' 'extra-cmake-modules')
groups=('hawaii')
options=('debug')
source=("https://github.com/hawaii-desktop/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('c41b21f2d744709e377812f537b81e95fb68fda4')

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
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
