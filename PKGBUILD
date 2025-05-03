# Maintainer: Michael Rydén

pkgname=libvips-notiff
pkgver=8.16.1
pkgrel=2
pkgdesc="A fast image processing library with low memory needs"
arch=('x86_64')
license=('LGPL-2.1-or-later')
url="https://libvips.github.io/libvips/"
depends=('cfitsio' 'fftw' 'libexif' 'libarchive' 'libimagequant' 'librsvg' 'libwebp' 'openexr'
         'highway' 'pango' 'libcgif' 'cairo' 'lcms2' 'openjpeg2')
makedepends=('gobject-introspection' 'libheif' 'libjxl' 'imagemagick' 'openslide'
             'poppler-glib' 'meson' 'gtk-doc' 'glib2-devel')
optdepends=('libheif: for heif module'
            'imagemagick: for magick module'
            'openslide: for openslide module'
            'poppler-glib: for poppler module'
            'python: for vipsprofile'
            'libjxl: for jxl module')
conflicts=('libvips')
provides=('libvips=8.15.3')
source=("https://github.com/libvips/libvips/releases/download/v$pkgver/vips-$pkgver.tar.xz")
sha512sums=('0046c48d5c08351258a176d91995f8baf003917fd7780b25f5921f259c03da072661f26c22b4524306e035d80956957c5045dbbf9a5ab4f87e9b8e16d81f7319')

build() {
  meson build vips-$pkgver \
    --prefix=/usr \
    -Dgtk_doc=true
    -Dtiff=disabled
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
