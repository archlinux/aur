# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Generic WPE WebKit backend using FreeDesktop technologies (Wayland)'
pkgname=wpebackend-fdo
pkgver=0.1
pkgrel=4
url=https://github.com/Igalia/WPEBackend-fdo
license=(custom:BSD)
arch=(x86_64 i686)
groups=(wpe)
depends=(glib2 wayland wpebackend opengl-driver)
makedepends=(cmake)
source=("https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz")
md5sums=(481a67db2bac28b4d28a9654b3eb92f2)
sha1sums=(3acc830c33db8adf6a5662d9757d23b9af3dba7e)
sha256sums=(76a95cb7b597618600ac8d69147adf7dd922121acab2725f6ed99ca5b743eaba)

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
