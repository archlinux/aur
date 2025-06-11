# Maintainer: Juliette Cordor
pkgname=arctis-bat
pkgrel=1
pkgver=0.2.0
pkgdesc="CLI tool for checking SteelSeries Arctis headsets battery on linux"
license=(Apache-2.0)
arch=(x86_64)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jewlexx/arctis-bat/archive/refs/tags/v$pkgver.tar.gz")
url="https://github.com/jewlexx/arctis-bat"
depends=(hidapi glibc)
makedepends=(meson ninja git)
sha256sums=(48089eeefbab2a416b99c18cc179790672d8faa3fb240055fc8b772ec91ca5cb)
provides=(arctis-bat)
conflicts=(arctis-bat)

prepare() {
    return 0
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
