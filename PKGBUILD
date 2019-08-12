# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Generic WPE WebKit backend using FreeDesktop technologies (Wayland)'
pkgname=wpebackend-fdo
pkgver=1.2.2
pkgrel=0
url=https://github.com/Igalia/WPEBackend-fdo
license=(custom:BSD)
arch=(x86_64 i686 aarch64)
groups=(wpe)
depends=(glib2 'libwpe>=1.2.0' opengl-driver)
makedepends=(cmake)
source=("https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz"{,.asc})
md5sums=('59b5fd6a3b64fe473458e16913ff9256' SKIP)
sha1sums=('d525044256dc7ee13fd64bc10d3e24e3b980125e' SKIP)
sha256sums=('a2a50631eff7ec7ad1f787ab7ea9a524148588edbb42fff614ee404e1bcc126d' SKIP)
validpgpkeys=('5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')

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
	cmake --build . -j$(nproc)
}

package () {
	DESTDIR="${pkgdir}" cmake --build _build --target install
	install -Dm644 "${pkgname}-${pkgver}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
