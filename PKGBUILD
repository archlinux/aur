# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_pkgbasename=sdl_image
pkgname=lib32-$_pkgbasename
pkgver=1.2.12
pkgrel=5
pkgdesc="A simple library to load images of various formats as SDL surfaces (32-bit)"
arch=('x86_64')
url="http://www.libsdl.org/projects/SDL_image/"
license=('LGPL')
depends=('lib32-sdl' 'lib32-libpng' 'lib32-libjpeg' 'lib32-libtiff' 'lib32-zlib' "$_pkgbasename")
makedepends=('gcc-multilib')
source=("https://www.libsdl.org/projects/SDL_image/release/SDL_image-${pkgver}.tar.gz")
sha512sums=('0e71b280abc2a7f15755e4480a3c1b52d41f9f8b0c9216a6f5bd9fc0e939456fb5d6c10419e1d1904785783f9a1891ead278c03e88b0466fecc6871c3ca40136')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd ${srcdir}/SDL_image-${pkgver}

  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd ${srcdir}/SDL_image-${pkgver}

  make DESTDIR=$pkgdir install
  rm -rf $pkgdir/usr/include
}

# vim: sw=2:ts=2 et:
