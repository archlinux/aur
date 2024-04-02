# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Doommsatic <keniscoolu@gmail.com>

pkgname=nba
pkgver=1.8.1
pkgrel=2
pkgdesc="highly accurate Nintendo Game Boy Advance emulator"
arch=('x86_64')
url="https://github.com/nba-emu/NanoBoyAdvance"
license=('GPL')
depends=('glew' 'qt6-base' 'sdl2')
makedepends=('cmake' 'git' 'glad')
source=($pkgname::git+https://github.com/nba-emu/NanoBoyAdvance.git#tag=v${pkgver})
sha256sums=('109a1ba01ae05b87bc8d81c7cdd3df0676af5cb477493afc50109f7a42820403')


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
