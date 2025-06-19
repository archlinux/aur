# Maintainer: Robert Manner <rmanni@gmail.com>

pkgname=widgie-git
pkgver=0.3.5
pkgrel=1
pkgdesc="A lightweight widget library for applications which do not need a splashscreen."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/manner/widgie"
license=('GPL3')
conflicts=('widgie')
provides=('widgie')
depends=()
optdepends=("ttf-nerd-fonts-symbols: (or a nerd font) for icon support")
makedepends=(wayland-protocols wayland libxkbcommon freetype2 libxkbcommon-x11 libxcb xcb-util-image xorgproto)
source=("git+https://gitlab.com/manner/widgie")
sha256sums=(SKIP)
options=('staticlibs')

_builddir="widgie"

pkgver() {
    cd "$_builddir"
    git describe --tags | sed -e 's,-,.,g'
}

build() {
    cd "$_builddir"
    ./configure --prefix=/usr --enable-release
    make -j$(nproc)
}

check() {
    cd "$_builddir"
    make check
}

package() {
    cd "$_builddir"
    make DESTDIR="$pkgdir" install
}
