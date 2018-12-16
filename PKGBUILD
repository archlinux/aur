# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libhandy-git
pkgver=0.0.5.r31.ge9e8add
pkgrel=1
pkgdesc="A library full of GTK+ widgets for mobile phones"
url="https://source.puri.sm/Librem5/libhandy"
license=(LGPL2.1)
arch=(i686 x86_64 armv6h armv7h)
depends=(gtk3)
makedepends=(git glade gobject-introspection meson vala)
provides=(libhandy)
conflicts=(libhandy)
source=("git+https://source.puri.sm/Librem5/libhandy.git")
md5sums=(SKIP)

pkgver() {
    cd libhandy
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson libhandy build -Dexamples=false -Dgtk_doc=true
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
