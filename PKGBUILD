# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=vibe
pkgver=0.9.0
pkgrel=1
pkgdesc="A collection of core classes used throughout Liri"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://liri.io"
license=('LGPL3')
depends=('qt5-base' 'qt5-declarative' 'qt5-tools' 'kwallet' 'solid' 'networkmanager-qt'
         'modemmanager-qt' 'pulseaudio' 'libqtxdg' 'fluid')
makedepends=('extra-cmake-modules')
conflicts=('libhawaii' 'libhawaii-git' 'libpapyros' 'libpapyros-git' 'vibe-git')
groups=('liri')
source=("https://github.com/lirios/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('95f3ad567029450e2e5a86659287e01d6d5465d20aadcbe7f6459ce4c1055b78')

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
