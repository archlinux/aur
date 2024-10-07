# Maintainer: buj <buj351@outlook.com>
pkgname=voidsprite-git
pkgver=alpha27.08.2024.r237.gf20f758
pkgrel=1
pkgdesc='Free pixelart editor made in SDL2 C++'
url='https://github.com/counter185/voidsprite'
source=('voidsprite::git+https://github.com/counter185/voidsprite.git')
arch=('i686' 'x86_64')
conflicts=('voidsprite')
provides=('voidsprite=${pkgver}')
sha256sums=(SKIP)
depends=(sdl2 sdl2_image sdl2_ttf libpng pugixml xdg-utils)
makedepends=(git meson gcc ninja python)
license=(GPL-2.0-only)

pkgver() {
    cd "${srcdir}/voidsprite"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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

