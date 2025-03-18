# Maintainer: buj <buj351@outlook.com>
pkgname=voidsprite-git
pkgver=2025.03.18
pkgrel=1
pkgdesc='Free pixelart editor made in SDL3 C++'
url='https://github.com/counter185/voidsprite'
source=('voidsprite::git+https://github.com/counter185/voidsprite.git')
arch=('i686' 'x86_64')
conflicts=('voidsprite')
provides=('voidsprite')
sha256sums=(SKIP)
depends=(sdl3 sdl3_image sdl3_ttf libpng pugixml xdg-utils libjxl brotli)
makedepends=(git meson gcc ninja python)
license=(GPL-2.0-only)

pkgver() {
    # voidsprite verisons are dmy dates, but we switch the order so pacman doesn't complain
    cd "$srcdir/voidsprite"
    git show -1 --no-patch --format=%ci | cut -f1 -d\ | tr - .
}

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

