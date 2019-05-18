# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Base library for the WPE WebKit port'
pkgname=libwpe
pkgver=1.2.0
pkgrel=0
url=https://github.com/WebPlatformForEmbedded/libwpe
arch=(x86_64 i686 aarch64)
groups=(wpe)
makedepends=(cmake opengl-driver)
conflicts=(libwpe-git)
replaces=(wpebackend)
depends=(gcc-libs libxkbcommon)
license=(custom:BSD)
source=("https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz")
sha512sums=('b2e08fc3a6992e2a8f6dcfb1116695417549c97ff8125b0fc32546f88a9f52c098c98b72d178ebd4e6970bd94edbda2f2c76930b912da6654233b4cc59bba689')

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
