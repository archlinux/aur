# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-widget-styles
pkgver=0.8.0
pkgrel=1
pkgdesc="Hawaii widget styles"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://hawaiios.org"
license=('LGPL')
depends=('fluid')
makedepends=('extra-cmake-modules')
conflicts=('hawaii-widget-styles-git')
groups=('hawaii')
source=("https://github.com/hawaii-desktop/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha1sums=('6ce4a75660cb1c03c10056570961267bd5a5ad9f')

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
