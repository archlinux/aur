# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=fragments
pkgver=1.1
pkgrel=1
pkgdesc="A GTK3 BitTorrent client following the GNOME Human Interface Guidelines"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/FragmentsApp/Fragments"
license=('GPL3')
depends=('gtk3')
makedepends=('git'
             'gobject-introspection'
             'libdazzle'
             'meson'
             'vala')
conflicts=("$pkgname-git")
source=("git+https://github.com/FragmentsApp/Fragments.git#tag=${pkgver}")
md5sums=('SKIP')

prepare() {
    cd "$srcdir/Fragments"
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
