# Maintainer: Blaadick <null>

_architectures="${MINGW_W64_ARCHS:-x86_64-w64-mingw32}"

pkgname="mingw-w64-libvips"
pkgver="8.18.7"
pkgrel=1
pkgdesc="A fast image processing library with low memory needs (mingw-w64)"
arch=("any")
url="https://www.libvips.org/"
license=("LGPL-2.1-or-later")
depends=(
    "mingw-w64-crt"
    "mingw-w64-glib2"
    "mingw-w64-expat"
    "mingw-w64-libjpeg-turbo"
    "mingw-w64-libpng"
    "mingw-w64-libtiff"
    "mingw-w64-libwebp"
    "mingw-w64-openjpeg2"
    "mingw-w64-openexr"
    "mingw-w64-cfitsio"
    "mingw-w64-libraw"
    "mingw-w64-librsvg"
    "mingw-w64-libexif"
    "mingw-w64-libarchive"
    "mingw-w64-lcms2"
    "mingw-w64-fftw"
    "mingw-w64-highway"
    "mingw-w64-pango"
    "mingw-w64-libheif"
    "mingw-w64-libjxl"
    "mingw-w64-poppler"
)
makedepends=("mingw-w64-meson")
options=("!strip" "!buildflags" "staticlibs")
source=("https://github.com/libvips/libvips/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("4b8684a199b08118bf68c6286bca8390ea6d618c4f2373816beb420d16a954b4f51bd90d86143dc59ac5cb302bf41f92c1afc7d8fc20d4a9c951642703b5dcb3")

build() {
    cd "libvips-$pkgver"

    for _arch in ${_architectures}; do
        $_arch-meson "build-$_arch" --buildtype release
        meson compile -C "build-$_arch"
    done
}

package() {
    cd "libvips-$pkgver"

    for _arch in ${_architectures}; do
        meson install -C "build-$_arch" --destdir "$pkgdir"
    done
}
