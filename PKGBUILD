# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_basename=libdvdnav
pkgname=lib32-libdvdnav
pkgver=7.0.0
pkgrel=1
pkgdesc="'Library to navigate DVD video disks' (32 bit)"
arch=(x86_64)
url='https://www.videolan.org/developers/libdvdnav.html'
license=(GPL-2.0-or-later)
depends=(
    lib32-libdvdread
    libdvdnav
)
makedepends=(
    git
    meson
)
source=("git+https://code.videolan.org/videolan/libdvdnav.git#tag=$pkgver")
b2sums=(64a37fb6c68aed46b2cbf2bd98e499bf9ed8694d9f358d07a2e630bba385bb48b909eea04097da86d0bc4f8958c987895fd98a7ba4d82119d8a8a4a9e6743583)
validpgpkeys=(65F7C6B4206BD057A7EB73787180713BE58D1ADC) # VideoLAN Release Signing Key

prepare() {
  cd $_basename
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson $_basename build \
            --libdir='/usr/lib32'

    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    rm -rf "$pkgdir/usr"/{include,share}
}
