# Maintainer: geno+dev@fireorbit.de

pkgname=purism-chatty-git
pkgver=0.0.1.r13.gdaaa736
pkgrel=1
pkgdesc="XMPP and SMS messaging via libpurple and Modemmanager"
url="https://source.puri.sm/Librem5/chatty"
license=(LGPL2.1)
arch=(i686 x86_64 armv6h armv7h)
depends=(gtk3)
makedepends=(pkg-config meson libhandy)
provides=(purism-chatty)
conflicts=(purism-chatty)
source=("git+https://source.puri.sm/Librem5/chatty.git")
md5sums=(SKIP)

pkgver() {
    git -C chatty describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    rm -rf build
    arch-meson chatty build -Dexamples=false -Dgtk_doc=true
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
