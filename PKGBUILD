# Maintainer: Kisuke-CZE <kisuke@kisuke.cz>
# Contributor: proudzhu <proudzhu.fdu at gmail.com>
pkgname=libvips
pkgver=8.6.0
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
conflicts=('libvips-git')
source=("https://github.com/jcupitt/libvips/archive/v${pkgver}.tar.gz")
sha256sums=('d4b575c161691580f71ab2755aba601f36d55783f2a6fe049bdbed569763a5f2')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
