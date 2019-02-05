# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Generic WPE WebKit backend using FreeDesktop technologies (Wayland)'
pkgname=wpebackend-fdo
pkgver=1.0.1
pkgrel=1
url=https://github.com/Igalia/WPEBackend-fdo
license=(custom:BSD)
arch=(x86_64 i686)
groups=(wpe)
depends=(glib2 'libwpe>=1.0.0' opengl-driver)
makedepends=(cmake)
source=("https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz")
sha512sums=('1856a9594e0f8fb8deca7df3290b50913d5c0710745d2ca72bb75d8d34be8a402fa964ed3e786c97236fd0e9c38f4529a640baeb27b3f60302f621f20ef0a162')

prepare () {
	mkdir -p _build
}

build () {
	cd _build
	cmake \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		"../${pkgname}-${pkgver}"
	cmake --build .
}

package () {
	DESTDIR="${pkgdir}" cmake --build _build --target install
	install -Dm644 "${pkgname}-${pkgver}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
