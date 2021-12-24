# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Doommsatic <keniscoolu@gmail.com>
pkgname=nba
pkgver=1.4
pkgrel=1
pkgdesc="A highly accurate Nintendo Game Boy Advance emulator."
arch=('x86_64')
url="https://github.com/nba-emu/NanoBoyAdvance"
license=('GPL')
depends=('sdl2' 'glew')
makedepends=('cmake' 'git')
_commit=809981ba3bdeb2e6ebc1ae0ea8b3c071896688f3
source=($pkgname-$pkgver::git+https://github.com/nba-emu/NanoBoyAdvance.git#commit=${_commit})
sha256sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	git submodule update --init
	cmake -B build \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
}

build() {
	cd "$pkgname-$pkgver"
	cmake --build build
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/bin/qt/NanoBoyAdvance "${pkgdir}/usr/bin/nba-qt"
	install -Dm755 build/bin/sdl/NanoBoyAdvance "${pkgdir}/usr/bin/nba-sdl"
}
