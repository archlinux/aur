# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-workspace
pkgver=0.8.1
pkgrel=1
pkgdesc="Applications for the Hawaii workspace"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://hawaiios.org"
license=('GPL')
depends=('qt5-tools' 'libhawaii' 'fluid' 'polkit-qt5' 'qt5-gstreamer')
# boost is needed for qt5-gstreamer, see https://bugs.archlinux.org/task/50580
makedepends=('git' 'gdb' 'extra-cmake-modules' 'greenisland' 'boost')
conflicts=('hawaii-workspace-git')
groups=('hawaii')
options=('debug')
install=$pkgname.install
source=("https://github.com/hawaii-desktop/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha1sums=('49e4e55aac786d178e4feab153e5afe2d88a427b')

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
	make VERBOSE=1
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
