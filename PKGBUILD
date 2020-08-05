# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=freeciv
pkgname=freeciv-git
pkgver=r25158.2054ee3a2c
pkgrel=1
pkgdesc="A multiuser clone of the famous Microprose game of Civilization"
arch=('x86_64')
url="http://www.freeciv.org/"
license=('GPL2')
depends=('curl' 'gtk3' 'lua' 'qt5-base' 'sdl2_gfx' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('python')
conflicts=('freeciv')
provides=('freeciv')
source=("git+https://github.com/freeciv/freeciv.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_basename}

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_basename}

    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-fcdb=sqlite3 \
        --enable-client=all \
        --enable-gitrev \
        --enable-aimodules=yes \
        --enable-shared \
        --enable-sdl-mixer \
        --enable-fcmp=all \
        --enable-sys-lua

    make
}

package() {
    cd ${_basename}

    make DESTDIR="${pkgdir}" install
}
