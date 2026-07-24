# Maintainer: Michael Rydén

pkgname=libvips-notiff
pkgver=8.18.4
pkgrel=1
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
sha512sums=('19eeafcb8bef187b056242c0852038a432672481476d16aabab97f2fd44e97852c96d28c730e32e60cf89d0afa3f4698a14c66f0bac5c04eceef082af6a69be8')

build() {
  meson setup build vips-$pkgver \
    --prefix=/usr \
    -Dtiff=disabled
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
