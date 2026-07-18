# Maintainer: Blaadick <null>

_architectures=("i686-w64-mingw32" "x86_64-w64-mingw32")

pkgname="mingw-w64-libvips"
pkgver="8.18.4"
pkgrel=1
pkgdesc="A fast image processing library with low memory needs (mingw-w64)"
arch=("any")
url="https://www.libvips.org/"
license=("LGPL-2.1")
depends=(
    "mingw-w64-crt"
    "mingw-w64-cfitsio"
    "mingw-w64-fftw"
    "mingw-w64-libexif"
    "mingw-w64-libarchive"
    "mingw-w64-librsvg"
    "mingw-w64-libwebp"
    "mingw-w64-openexr"
    "mingw-w64-highway"
    "mingw-w64-pango"
    "mingw-w64-cairo"
    "mingw-w64-lcms2"
    "mingw-w64-openjpeg2"
    "mingw-w64-poppler"
    "mingw-w64-libraw"
)
optdepends=(
    "mingw-w64-libjxl"
    "mingw-w64-libheif"
)
makedepends=("mingw-w64-meson")
options=("!strip" "!buildflags" "staticlibs")
source=("https://github.com/libvips/libvips/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("5bafec745ce96775ed462a4454cf084c5458936c8d64cccb711b56242a6afb30e8c68818753ea52b196943715d4afb2866243806754f9aabd5525e2b4be0231b")

build() {
    cd "libvips-$pkgver"

    for _arch in ${_architectures[@]}; do
        $_arch-meson "build-$_arch" --buildtype release
        meson compile -C "build-$_arch"
    done
}

package() {
    cd "libvips-$pkgver"

    for _arch in ${_architectures[@]}; do
        meson install -C "build-$_arch" --destdir "$pkgdir"
    done
}
