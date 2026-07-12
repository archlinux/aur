# Maintainer: Robert Manner <rmanni@gmail.com>

pkgname=widgie
pkgver=0.3.8
pkgrel=1
pkgdesc="A lightweight widget library for applications which do not need a splashscreen."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/manner/widgie"
license=('GPL3')
conflicts=('widgie-git')
depends=()
optdepends=("ttf-dejavu-nerd: (or a nerd font) for icon support")
makedepends=(wayland-protocols wayland libxkbcommon freetype2 libxkbcommon-x11 libxcb xcb-util-image xorgproto flint)
source=("https://gitlab.com/manner/widgie/-/archive/$pkgver/widgie-$pkgver.tar.gz")
options=('staticlibs')
sha256sums=('f662d2bdde9c3fdce8f2b71b6b059e28497fa2648ee2bcaa9a656d348bc0a0e3')

_builddir="$pkgname-$pkgver"

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
