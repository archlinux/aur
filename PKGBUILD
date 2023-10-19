# Maintainer: raihan2000 <raihan1999ahamed@gmail.com>

pkgname=libssc
pkgdesc="Library to expose Qualcomm Sensor Core sensors"
pkgver=0.1.3.r6.g586b412
pkgrel=1
_arches=specific
arch=(any)
license=(GPL-3.0-or-later)
url=https://codeberg.org/DylanVanAssche/libssc
provides=(liblibssc.so)
depends=(
    "libqmi>=1.33.4"
    glib2
    protobuf-c
)
makedepends=(
    linux-headers
    meson
    git
)
_commit=586b412dfa4f6819d847d2cadf02073111f4caee #main
source=("git+https://codeberg.org/DylanVanAssche/libssc.git#commit=$_commit")
sha256sums=(SKIP)

pkgver() {
    cd libssc
    git describe --long --abbrev=7 --tags $_commit | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd libssc
}

build() {
    arch-meson libssc build
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install --no-rebuild -C build
}
