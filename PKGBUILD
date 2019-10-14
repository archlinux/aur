# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=drawing-git
pkgver=0.4.1.r116.g75f8140
pkgrel=1
pkgdesc="Drawing application for the GNOME desktop"
url="https://github.com/maoschanz/drawing"
arch=(any)
license=(GPL3)
depends=(gtk3 python-cairo python-gobject)
makedepends=(git meson)
conflicts=(drawing)
source=("git+https://github.com/maoschanz/drawing.git")
sha256sums=(SKIP)

pkgver() {
    cd drawing
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson drawing build
    ninja -C build
}

check() {
    meson test -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build
}
