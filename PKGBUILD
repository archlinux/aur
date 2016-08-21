# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-system-preferences
pkgver=0.8.0
pkgrel=1
pkgdesc="Hawaii system preferences"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://hawaiios.org"
license=('GPL')
depends=('fluid' 'libhawaii' 'polkit-qt5' 'libkscreen' 'xkeyboard-config')
conflicts=('hawaii-system-preferences')
replaces=('hawaii-system-preferences')
provides=('hawaii-system-preferences')
makedepends=('extra-cmake-modules' 'qt5-tools')
conflicts=('hawaii-system-preferences-git')
groups=('hawaii')
options=('debug')
source=("https://github.com/hawaii-desktop/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha1sums=('eda40c22ce884b0c36b8bba9c270b2b2da529945')

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
