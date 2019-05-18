# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Generic WPE WebKit backend using FreeDesktop technologies (Wayland)'
pkgname=wpebackend-fdo
pkgver=1.2.0
pkgrel=0
url=https://github.com/Igalia/WPEBackend-fdo
license=(custom:BSD)
arch=(x86_64 i686 aarch64)
groups=(wpe)
depends=(glib2 'libwpe>=1.2.0' opengl-driver)
makedepends=(cmake)
source=("https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz")
sha512sums=('05bc2523d18474b076d77b868d4932ca850bf4abc9a94a14af510901d250ce0cf0d2d416ffd47b570080c55252dfa30d53c80e19353bff40a009002e5ed90c4b')

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
