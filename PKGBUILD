# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

_pkgbasename=openal
pkgname=lib32-$_pkgbasename
pkgver=1.13
pkgrel=1
pkgdesc="OpenAL audio library for use with opengl (32-bit)"
arch=('x86_64')
url="http://www.openal.org/"
license=('LGPL')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('lib32-alsa-lib' 'lib32-sdl' 'lib32-libpulse' 'pkgconfig' 'cmake' gcc-multilib)
options=('!libtool')
source=(http://kcat.strangesoft.net/openal-releases/openal-soft-${pkgver}.tar.bz2)
md5sums=('58b7d2809790c70681b825644c5f3614')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${srcdir}/${_pkgbasename}-soft-${pkgver}/build
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D LIB_INSTALL_DIR=/usr/lib32 ..
  make
}

package() {
  cd ${srcdir}/${_pkgbasename}-soft-${pkgver}/build
  make DESTDIR=${pkgdir}/ install 

  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
