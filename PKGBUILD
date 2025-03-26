#  Maintainer: Leonardo Miliani <leonardo AT leonardomiliani DOT com>
pkgname=sjasmplus-z00m128
pkgver=1.21.0
pkgrel=1
pkgdesc="SjASMplus is a Z80 cross-assembler"
arch=(x86_64)
url="https://github.com/z00m128/sjasmplus"
license=(BSD)
makedepends=(lua cmake)
source=("https://github.com/z00m128/sjasmplus/releases/download/v$pkgver/sjasmplus-$pkgver-src.tar.xz")
sha256sums=('f22d303e0f9dbc2c8c38e7552946557959e64675d3ba865396fd8542b75fa01a')

build() {
	cmake -B build -S sjasmplus-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSYSTEM_LUA=On \
		-DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	depends=(lua)
	conflicts=(sjasmplus)

	DESTDIR="$pkgdir" cmake --install build

	install -m644 -Dt "${pkgdir}/usr/share/doc/${pkgname}" sjasmplus-${pkgver}/docs/{*.html,lua.gif}
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" sjasmplus-${pkgver}/LICENSE.md
	# kde syntax highlighting
	install -m644 -Dt "${pkgdir}/usr/share/org.kde.syntax-highlighting/syntax/" sjasmplus-${pkgver}/asm-z80-sj.xml
}
