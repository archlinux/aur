# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Base library for the WPE WebKit port'
pkgname=libwpe
pkgver=1.2.1
pkgrel=0
url=https://github.com/WebPlatformForEmbedded/libwpe
arch=(x86_64 i686 aarch64)
groups=(wpe)
makedepends=(cmake opengl-driver)
conflicts=(libwpe-git)
replaces=(wpebackend)
depends=(gcc-libs libxkbcommon)
license=(custom:BSD)
source=("https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz"{,.asc})
md5sums=('9f26865f06ecf933ddbbf067a7be735f' SKIP)
sha1sums=('d3f6211a2acafe1bd1f41e826c8efae35335fc92' SKIP)
sha256sums=('00e103c6fa226b0d979c29d14c9e8168c4bec7b0b5108f3705a037cda5609d7d' SKIP)
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
