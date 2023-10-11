# Maintainer: Raihan Ahamed <raihan1999ahamed@gmail.com>

pkgbase=libssc
pkgname=$pkgbase-git
pkgdesc="Library to expose Qualcomm Sensor Core sensors"
pkgver=0.1.3+r6+g586b412
pkgrel=1
_arches=specific
arch=(any)
license=(GPL-3.0-or-later)
url=https://codeberg.org/DylanVanAssche/libssc
provides=(liblibssc.so)
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
_commit=586b412dfa4f6819d847d2cadf02073111f4caee
source=("git+https://codeberg.org/DylanVanAssche/libssc.git#commit=$_commit")
sha256sums=(SKIP)

pkgver() {
    cd $pkgbase
    git describe --tags | sed 's/-rc/rc/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
    cd $pkgbase
}

build() {
    arch-meson $pkgbase build
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install --no-rebuild -C build
}
