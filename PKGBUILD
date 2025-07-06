# Maintainer: Juliette Cordor
pkgname=arctis-bat
pkgrel=1
pkgver=0.2.1
pkgdesc="CLI tool for checking SteelSeries Arctis headsets battery on linux"
license=(Apache-2.0)
arch=(x86_64)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jewlexx/arctis-bat/archive/refs/tags/v$pkgver.tar.gz")
url="https://github.com/jewlexx/arctis-bat"
depends=(hidapi glibc)
makedepends=(meson ninja git)
sha256sums=(b68f97442e3f8549b7eb3e5ba72f41eac22f4bc4b992fea3452177666fb10b3f)
provides=(arctis-bat)
conflicts=(arctis-bat)

prepare() {
    cd "$pkgname-$pkgver"

    meson subprojects download
}

build() {
    local BUILD_DIR=builddir

    arch-meson "$pkgname-$pkgver" "$BUILD_DIR" -Dcpu_native=true
    meson compile -C $BUILD_DIR
}

package() {
    local BUILD_DIR=builddir

    meson install -C $BUILD_DIR --destdir "$pkgdir"
}
