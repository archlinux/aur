# Maintainer: Robert Manner <rmanni@gmail.com>

pkgname=widgie
pkgver=0.2.2
pkgrel=1
pkgdesc="A lightweight widget library for applications which do not need a splashscreen."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/manner/widgie"
license=('GPL3')
conflicts=('widgie-git')
depends=()
optdepends=("ttf-nerd-fonts-symbols: (or a nerd font) for icon support")
makedepends=(wayland-protocols wayland libxkbcommon freetype2 libxkbcommon-x11 libxcb xcb-util-image xorgproto)
source=("https://gitlab.com/manner/widgie/-/archive/$pkgver/widgie-$pkgver.tar.gz")
options=('staticlibs')
sha256sums=('267c35cffbe07ceb84b95b420113365294a81affac955fdaef43f2e4d4edd22e')

_builddir="$pkgname-$pkgver"
_makeflags="FEATURE_WAYLAND=shared FEATURE_X11=shared PREFIX=/usr"

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
