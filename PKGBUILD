# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-system-preferences
pkgver=0.4.0
pkgrel=1
pkgdesc="Hawaii system preferences"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/hawaii-desktop"
license=('GPL')
depends=('qt5-base' 'qt5-declarative' 'xkeyboard-config' 'hawaii-shell')
conflicts=('hawaii-system-preferences')
replaces=('hawaii-system-preferences')
provides=('hawaii-system-preferences')
makedepends=('extra-cmake-modules' 'qt5-tools')
conflicts=('hawaii-system-preferences-git')
groups=('hawaii')
options=('debug')
source=("https://github.com/hawaii-desktop/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('d88e031e7ed9be20e7559820a7649a4b')

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
