# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libhandy-git
pkgver=0.0.3.r4.g2a2fc18
pkgrel=1
pkgdesc="A library full of GTK+ widgets for mobile phones"
url="https://source.puri.sm/Librem5/libhandy"
license=(LGPL2.1)
arch=(i686 x86_64 armv6h armv7h)
depends=(gtk3)
makedepends=(pkg-config meson gobject-introspection)
provides=(libhandy)
conflicts=(libhandy)
source=("git+https://source.puri.sm/Librem5/libhandy.git")
md5sums=(SKIP)

pkgver() {
    cd libhandy
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    rm -rf build
    arch-meson libhandy build -Dexamples=false -Dgtk_doc=true
    ninja -C build
    ninja -C build libhandy-doc
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
