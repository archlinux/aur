# Maintainer: Michael Rydén

pkgname=libvips-notiff
pkgver=8.17.1
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
provides=("libvips=$pkgver")
options=('!debug')

source=("https://github.com/libvips/libvips/releases/download/v$pkgver/vips-$pkgver.tar.xz")
sha512sums=('04962e7d3fb8956c986f3aed7a10c4927195bc555a22c805a5b190c257e9e8b0fe97eddd0eb44e0e7d9047ba5671e96ac88f50a2597caa4f78c84ce1091541ff')

build() {
  meson setup build vips-$pkgver \
    --prefix=/usr \
    -Dtiff=disabled
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
