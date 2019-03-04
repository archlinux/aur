# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Base library for the WPE WebKit port'
pkgname=libwpe
pkgver=1.0.0
pkgrel=2
url=https://github.com/WebPlatformForEmbedded/libwpe
arch=(x86_64 i686 aarch64)
groups=(wpe)
makedepends=(cmake opengl-driver)
conflicts=(libwpe-git)
replaces=(wpebackend)
depends=(gcc-libs libxkbcommon)
license=(custom:BSD)
source=("https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz")
sha512sums=('9c4648c64b58f5056ecd0a70a0e78176edb476500f74925ed2cbaa9f704d117f4427341d2cf5a5f2549a64b904ab7c796370343847452c5e1e5e45747b0ff5f9')

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
