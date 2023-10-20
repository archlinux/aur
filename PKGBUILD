# Maintainer: raihan2000 <raihan1999ahamed@gmail.com>

pkgname=libssc-git
pkgdesc="Library to expose Qualcomm Sensor Core sensors"
pkgver=0.1.3.r6.g586b412
pkgrel=1
_arches=specific
arch=(any)
license=(GPL-3.0-or-later)
url=https://codeberg.org/DylanVanAssche/libssc
provides=(
    libssc
    liblibssc.so
)
conflicts=(libssc)
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
source=("git+https://codeberg.org/DylanVanAssche/libssc.git")
sha256sums=(SKIP)

pkgver() {
    cd libssc
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
