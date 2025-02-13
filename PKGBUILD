# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: JustKidding <jk@vin.ovh>
# Contributor: proudzhu <proudzhu.fdu at gmail.com>

pkgname=libvips-git
_pkgname=libvips
pkgver=8.16.0.r86.gee7f8774c
pkgrel=1
pkgdesc="A fast image processing library with low memory needs"
arch=('i686' 'x86_64')
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
provides=('libvips')
conflicts=('libvips')
source=("$_pkgname::git+https://github.com/libvips/libvips.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson setup build libvips \
    --prefix=/usr \
    -Dgtk_doc=true \
    --buildtype release
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
