# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Doommsatic <keniscoolu@gmail.com>

pkgname=nba
pkgver=1.8.2
pkgrel=1
pkgdesc="highly accurate Nintendo Game Boy Advance emulator"
arch=('x86_64')
url="https://github.com/nba-emu/NanoBoyAdvance"
license=('GPL')
depends=('glew' 'qt6-base' 'sdl2')
makedepends=('cmake' 'git' 'glad')
source=($pkgname::git+https://github.com/nba-emu/NanoBoyAdvance.git#tag=v${pkgver})
sha256sums=('c220a0229d8f9a77c6bf959037c13138336f20234505e41562c4fec6342e0c28')


prepare() {
	cd "$pkgname"
	git submodule update --init
	cmake -B build \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DUSE_QT6='ON' \
        -Wno-dev
}

build() {
	cd "$pkgname"
	cmake --build build
}

package() {
	cd "$pkgname"
	install -Dm755 build/bin/qt/NanoBoyAdvance "${pkgdir}/usr/bin/nba"
}
