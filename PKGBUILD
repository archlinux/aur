# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Doommsatic <keniscoolu@gmail.com>

pkgname=nba
pkgver=1.7.1
pkgrel=1
pkgdesc="highly accurate Nintendo Game Boy Advance emulator"
arch=('x86_64')
url="https://github.com/nba-emu/NanoBoyAdvance"
license=('GPL')
depends=('glew' 'qt5-base' 'sdl2')
makedepends=('cmake' 'git')
source=($pkgname::git+https://github.com/nba-emu/NanoBoyAdvance.git#tag=v${pkgver})
sha256sums=('SKIP')


prepare() {
	cd "$pkgname"
	git submodule update --init
	cmake -B build \
        -DCMAKE_INSTALL_PREFIX='/usr' \
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
