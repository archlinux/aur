# Maintainer: Leonardo Miliani <leonardo AT leonardomiliani DOT com>
pkgname=sjasmplus
pkgver=1.19.0
pkgrel=1
pkgdesc="SjASMplus is a Z80 cross-assembler"
arch=(x86_64)
url="https://github.com/z00m128/sjasmplus"
license=(BSD)
depends=(glibc)
optdepends=('lua: Lua scripting language'
            'tolua++: integrate C/C++ code with Lua')
conflicts=(sjasmplus)
makedepends=(cmake)
source=("https://github.com/z00m128/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-src.tar.xz")

sha256sums=('0d17e9a7f34811ca927803d6502e5620b32b14b13d4d8e782ade45cb2ef70c26')

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../$pkgname-$pkgver \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd build
	install -Dm755 sjasmplus "$pkgdir/usr/local/bin/$pkgname"
}
