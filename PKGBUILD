# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=fragments
pkgver=1.2
pkgrel=1
pkgdesc="A GTK3 BitTorrent client following the GNOME Human Interface Guidelines"
arch=(i686 x86_64 armv6h armv7h)
url="https://github.com/haecker-felix/Fragments"
license=(GPL3)
depends=(curl
         gtk3
         libb64
         libevent
         libnatpmp
         miniupnpc)
makedepends=(git
             gobject-introspection
             libdazzle
             libhandy
             meson
             vala)
conflicts=("$pkgname-git")
source=("git+https://github.com/haecker-felix/Fragments.git#tag=${pkgver}")
md5sums=(SKIP)

prepare() {
    cd Fragments
    git submodule update --init --recursive
}

build() {
    rm -rf build
    arch-meson Fragments build
    ninja -v -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}
