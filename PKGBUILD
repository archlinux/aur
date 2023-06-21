# Maintainer: Robert Manner <rmanni@gmail.com>

pkgname=widgie-git
pkgver=0.2.1.1.ge72fbed
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
_makeflags="FEATURE_WAYLAND=shared FEATURE_X11=shared PREFIX=/usr"

pkgver() {
    cd "$_builddir"
    git describe --tags | sed -e 's,-,.,g'
}

build() {
    cd "$_builddir"
    make -j$(nproc) $_makeflags
}

check() {
    cd "$_builddir"
    make $_makeflags check
}

package() {
    cd "$_builddir"
    make $_makeflags DESTDIR="$pkgdir" install
}
