# Maintainer: Michael Rydén

pkgname=libvips-notiff
pkgver=8.15.3
pkgrel=1
pkgdesc="A fast image processing library with low memory needs without TIFF support"
arch=('x86_64')
license=('LGPL-2.1-or-later')
url="https://libvips.github.io/libvips/"
depends=('cfitsio' 'fftw' 'libexif' 'libarchive' 'libimagequant' 'librsvg' 'libwebp' 'openexr'
         'highway' 'pango' 'libcgif' 'python' 'cairo')
makedepends=('gobject-introspection' 'libheif' 'libjxl' 'imagemagick' 'openslide'
             'poppler-glib' 'meson' 'gtk-doc' 'glib2-devel')
optdepends=('libheif: for heif module'
            'imagemagick: for magick module'
            'openslide: for openslide module'
            'poppler-glib: for poppler module'
            'libjxl: for jxl module')
conflicts=('libvips')
provides=('libvips=8.15.3')
source=("https://github.com/libvips/libvips/releases/download/v$pkgver/vips-$pkgver.tar.xz")
sha512sums=('7ebeacef00939dff6a03f346e1d7498c9cc6ff84aff3a273dae57ae0b2332cb1da59a94ada1b68d86578af5540c1671badd636f0916e48cc7011b9141f99fc1e')


build() {
  meson build vips-$pkgver \
    --prefix=/usr \
    -Dgtk_doc=true \
    -Dtiff=disabled
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
