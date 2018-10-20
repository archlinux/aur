# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_modulename=shell

pkgname=liri-${_modulename}
pkgver=0.9.0
pkgrel=1
pkgdesc="QtQuick and Wayland based shell for convergence"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('qt5-tools' 'qt5-wayland' 'qt5-accountsservice'
         'pam' 'greenisland-git')
optdepends=('weston: nested mode support')
makedepends=('extra-cmake-modules')
conflicts=('hawaii-shell' 'papyros-shell' 'liri-shell-git')
replaces=('hawaii-shell' 'papyros-shell')
groups=('liri')
source=("https://github.com/lirios/${_modulename}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('09ad65078beedca1119297f15c4dc7d392fb9cbdf92338aea457dfffd636f339')

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../${pkgname}-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE_INSTALL_LIBDIR=lib \
		-DKDE_INSTALL_LIBEXECDIR=lib
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
