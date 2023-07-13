#  Maintainer: Leonardo Miliani <leonardo AT leonardomiliani DOT com>
pkgname=sjasmplus-z00m128
pkgver=1.20.3
pkgrel=1
pkgdesc="SjASMplus is a Z80 cross-assembler"
arch=(x86_64)
url="https://github.com/z00m128/sjasmplus"
license=(BSD)
depends=(lua)
makedepends=(cmake)
source=("https://github.com/z00m128/sjasmplus/releases/download/v$pkgver/sjasmplus-$pkgver-src.tar.xz")

sha256sums=('343839b79bc8bc79f97ac0b3ac05ea9c17799aa561af46f3ac7a1da863b1b286')

build() {
	cmake -B build -S sjasmplus-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSYSTEM_LUA=On \
		-DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	optdepends=('tolua++: integrate C/C++ code with Lua')
	conflicts=(sjasmplus)

	DESTDIR="$pkgdir" cmake --install build
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" sjasmplus-${pkgver}/LICENSE.md
}
