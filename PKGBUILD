# Maintainer: Michael Rydén

pkgname=libvips-notiff
pkgver=8.16.0
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
sha512sums=('4035c6c08a19cb281ec0d901f8d0c2077e3312a79c1191b5b070aa411e5de0176d7d4e246da8f40c50cd93cf89433ac330b3ee618c1a996a79d58d1d66ec57f4')


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
