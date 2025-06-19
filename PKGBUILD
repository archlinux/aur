# Maintainer: Robert Manner <rmanni@gmail.com>

pkgname=widgie
pkgver=0.3.5
pkgrel=1
pkgdesc="A lightweight widget library for applications which do not need a splashscreen."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/manner/widgie"
license=('GPL3')
conflicts=('widgie-git')
depends=()
optdepends=("ttf-dejavu-nerd: (or a nerd font) for icon support")
makedepends=(wayland-protocols wayland libxkbcommon freetype2 libxkbcommon-x11 libxcb xcb-util-image xorgproto)
source=("https://gitlab.com/manner/widgie/-/archive/$pkgver/widgie-$pkgver.tar.gz")
options=('staticlibs')
sha256sums=('49c40803cd65d587f17f6f9b9e8e0ae100dde303eedde90112ccbecf4b4dd60d')

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
