# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-workspace
pkgver=0.6.90
pkgrel=1
pkgdesc="Applications for the Hawaii workspace"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://hawaiios.org"
license=('GPL2')
depends=('libhawaii' 'fluid' 'polkit-qt5' 'qt5-gstreamer')
makedepends=('git' 'gdb' 'extra-cmake-modules' 'greenisland')
conflicts=('hawaii-workspace-git')
groups=('hawaii')
options=('debug')
install=$pkgname.install
#source=("https://github.com/hawaii-desktop/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
source=("https://codeload.github.com/hawaii-desktop/${pkgname}/legacy.tar.gz/3f301004ddd506834b1f008c3514275d33f8c74d")
sha1sums=('9dc3e46b8f65b5619b5a6c6ab4ca5425e4b7cab2')

prepare() {
	mkdir -p build
}

build() {
	cd build
	#cmake ../${pkgname}-${pkgver} \
	cmake ../hawaii-desktop-hawaii-workspace-3f30100 \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DLIBEXEC_INSTALL_DIR=lib \
		-DQML_INSTALL_DIR=lib/qt/qml \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	make VERBOSE=1
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
