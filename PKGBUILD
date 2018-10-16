# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phosh
pkgver=0.0.1
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
conflicts=(phosh-git)
source=("https://source.puri.sm/Librem5/phosh/-/archive/v${pkgver}/phosh-v${pkgver}.tar.gz")
sha256sums=('841d97b48c146c0c8ecd604d1769cf9715d8609de2e36868d416714d50903d63')

build() {
    rm -rf build
    arch-meson phosh-v${pkgver} build -Dtests=false
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
