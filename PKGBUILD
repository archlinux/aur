# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=fragments
pkgname=$_pkgname-git
pkgver=latest
pkgrel=1
pkgdesc="A GTK3 BitTorrent client following the GNOME Human Interface Guidelines"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/FragmentsApp/Fragments"
license=('GPL3')
depends=('gtk3')
makedepends=('git'
             'vala'
             'gobject-introspection'
             'meson'
             'libdazzle'
             'libb64'
             'libutp'
             'dht'
             'libevent'
             'miniupnpc'
             'libnatpmp'
             'transmission-cli')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/FragmentsApp/Fragments.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/Fragments"
    git describe --always | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
    rm -rf build
    arch-meson Fragments build
    ninja -v -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}
