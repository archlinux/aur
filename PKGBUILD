# Maintainer: buj <buj351@outlook.com>
pkgname=voidsprite
_pkgver=18.03.2025
pkgver=$(echo $_pkgver | tr '.' $'\n' | tac | paste -s -d '.')+alpha
pkgrel=3
pkgdesc='Free pixelart editor made in SDL2 C++'
url='https://github.com/counter185/voidsprite'
source=("voidsprite::git+https://github.com/counter185/voidsprite.git#tag=alpha${_pkgver}")
arch=('i686' 'x86_64')
sha256sums=(SKIP)
depends=(sdl2 sdl2_image sdl2_ttf libpng pugixml xdg-utils libjxl brotli)
makedepends=(git meson gcc ninja python)
license=(GPL-2.0-only)

build() {
    arch-meson voidsprite build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}

