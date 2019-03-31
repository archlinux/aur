# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=drawing-git
pkgver=0.2.r4.g3f49a0e
pkgrel=1
pkgdesc="Drawing application for the GNOME desktop"
url="https://github.com/maoschanz/drawing"
arch=(any)
license=(GPL)
depends=(gtk3 python)
makedepends=(git meson python)
provides=(drawing com.github.maoschanz.Drawing)
conflicts=(drawing)
source=("git+https://github.com/maoschanz/drawing.git")
sha256sums=(SKIP)

pkgver() {
    cd drawing
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson drawing build
    ninja -C build
}

#check() {
#    meson test -C build
#}

package() {
    DESTDIR="$pkgdir" meson install -C build
}
