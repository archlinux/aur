# Maintainer: proudzhu <proudzhu at gmail.com>

pkgname=libvips-git
_pkgname=libvips
pkgver=8.0.beta.r23.g045678d
pkgrel=1
pkgdesc="A fast image processing library with low memory needs."
arch=('i686' 'x86_64')
url="http://www.vips.ecs.soton.ac.uk"
license=('LGPL 2.1+')
depends=('glib2' 'libxml2' 'libjpeg' 'libpng')
makedepends=('git' 'gobject-introspection' 'gtk-doc' 'swig' 'libexif'
             'libtiff' 'fftw' 'lcms2' 'libwebp' 'openexr')
optdepends=('gobject-introspection: for vips8 python binding'
            'libexif: for EXIF metadata support'
            'fftw: for fourier transforms support'
            'lcms2: transforming images with ICC profiles'
            'libwebp: for WebP image support'
            'openexr: for OpenEXR image support(only read)')
provides=('libvips')
conflicts=('libvips')
source=("$_pkgname::git+https://github.com/jcupitt/libvips.git")
md5sums=('SKIP') #generate with 'makepkg -g'

pkgver() {
  cd "$_pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
