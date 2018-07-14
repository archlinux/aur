# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Generic WPE WebKit backend using FreeDesktop technologies (Wayland)'
pkgname=wpebackend-fdo
pkgver=0.1
pkgrel=1
url=https://github.com/Igalia/WPEBackend-fdo
license=(custom:BSD)
arch=(x86_64 i686)
depends=(glib2 wayland wpebackend opengl-driver)
source=("https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz")
md5sums=(481a67db2bac28b4d28a9654b3eb92f2)
sha1sums=(3acc830c33db8adf6a5662d9757d23b9af3dba7e)
sha256sums=(76a95cb7b597618600ac8d69147adf7dd922121acab2725f6ed99ca5b743eaba)

build () {
	cd "${pkgname}-${pkgver}"
	rm -rf _build
	mkdir _build
	cd _build
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		..
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" make -C _build install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
