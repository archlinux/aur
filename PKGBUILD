# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Generic WPE WebKit backend using FreeDesktop technologies (Wayland)'
pkgname=wpebackend-fdo
pkgver=1.0.0
pkgrel=1
url=https://github.com/Igalia/WPEBackend-fdo
license=(custom:BSD)
arch=(x86_64 i686)
groups=(wpe)
depends=(glib2 wayland 'libwpe>=1.0.0' opengl-driver)
makedepends=(cmake)
source=("https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz")
sha512sums=('1daf32c1c83ac11377231691945f6feaced39ce404dd3486e4f002156181512def369df04ac66336ab0469918a0dc46bd6648268e1727568acbb1c780f49fb5a')

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
