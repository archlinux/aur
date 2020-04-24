# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=fragments-git
pkgver=1.4.r134.g5f1ed65
pkgrel=1
pkgdesc="BitTorrent client for GNOME"
arch=(i686 x86_64 armv6h armv7h)
url="https://gitlab.gnome.org/World/Fragments"
license=(GPL3)
depends=(curl
         libb64
         libevent
         libhandy
         libnatpmp
         miniupnpc)
makedepends=(git
             gobject-introspection
             libdazzle
             libhandy
             meson
             vala
             libtransmission)
provides=(fragments)
conflicts=(fragments)
source=("git+https://gitlab.gnome.org/World/Fragments.git")
sha256sums=('SKIP')

pkgver() {
    cd Fragments
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson Fragments build
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}
