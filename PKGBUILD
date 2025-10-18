# Maintainer: Clément Vicart <clem.vicart@gmail.com>
pkgname=gameoflife-git
pkgver=r9.ec3b15f
pkgrel=1
pkgdesc="Simple Game of Life written in C"
arch=('x86_64')
url="https://github.com/xolider/game-of-life"
license=('GPL-1.0-or-later')
depends=(sdl3 glibc sdl3_ttf ttf-roboto)
makedepends=(cmake ninja git)
source=("${pkgname}-${pkgver}-${pkgrel}::git+https://github.com/xolider/game-of-life.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname-$pkgver-$pkgrel"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cmake -S "$pkgname-$pkgver-$pkgrel" -B build -G Ninja -DROBOTO_TTF_PATH=/usr/share/fonts/TTF/Roboto-Regular.ttf
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build --prefix=/usr
}
