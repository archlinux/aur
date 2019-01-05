# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phosh
pkgver=0.0.2
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
source=("https://source.puri.sm/Librem5/phosh/-/archive/v${pkgver}/phosh-v${pkgver}.tar.gz"
        "fix-source-path.patch")
sha256sums=('55d5d08fae1c0ccc326cb5dd761516862622faa920ad2b9a0ed3a250e741526e'
            '4ef6958f314f903e8f86b7410a93927b039342383d83ac9d2704c28e4bb93828')

prepare() {
    cd phosh-v${pkgver}
    patch -p1 < ../fix-source-path.patch
}

build() {
    rm -rf build
    arch-meson phosh-v${pkgver} build
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
