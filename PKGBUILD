# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog
pkgver=0.2.0
pkgrel=4
url=https://github.com/Igalia/cog
arch=(i686 x86_64 aarch64)
groups=(wpe)
conflicts=(cog-git)
depends=('wpewebkit>=2.22.0' 'wpebackend-fdo>=1.0.0')
makedepends=(cmake)
license=(custom:MIT)
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz.asc")
validpgpkeys=('5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')
md5sums=('2fcb68ae8d52bb4212f9e24724b83f33' 'SKIP')
sha1sums=('0b34082282abff0563922f3b1c3621f0f0706ac1' 'SKIP')
sha256sums=('206302966c6019260f5a7a20b4c6afbd4ce77530f7b9cd638fafeed07e47cada' 'SKIP')

prepare () {
	mkdir -p _build
}

build () {
	cd _build
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
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
