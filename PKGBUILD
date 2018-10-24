# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phosh-git
pkgver=0.0.1.r44.g3fb62b2
pkgrel=1
pkgdesc="A pure Wayland shell prototype for GNOME on mobile devices"
url="https://source.puri.sm/Librem5/phosh"
license=("GPL3")
arch=(i686 x86_64 armv6h armv7h)
depends=(gtk3
         vala
         gnome-desktop
         gobject-introspection
         gtk-doc
         libhandy
         wlroots)
makedepends=(git
             pkg-config
             meson)
provides=(phosh)
conflicts=(phosh)
source=("git+https://source.puri.sm/Librem5/phosh.git")
sha256sums=("SKIP")

pkgver() {
    cd phosh
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    rm -rf build
    arch-meson phosh build -Dtests=false
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
