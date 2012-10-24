# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_pkgbasename=sdl_image
pkgname=lib32-$_pkgbasename
pkgver=1.2.12
pkgrel=2
pkgdesc='Simple library to load images of various formats as SDL surfaces (32-bit)'
arch=('x86_64')
url="http://www.libsdl.org/projects/SDL_image/"
license=('LGPL')
depends=('lib32-sdl' 'lib32-libpng' 'lib32-libjpeg' 'lib32-libtiff' 'lib32-zlib' "$_pkgbasename")
makedepends=('gcc-multilib')
options=('!libtool')
source=(http://www.libsdl.org/projects/SDL_image/release/SDL_image-${pkgver}.tar.gz)
md5sums=('a0f9098ebe5400f0bdc9b62e60797ecb')

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
