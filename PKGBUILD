# Maintainer: orumin <dev@orum.in>

_basename=libgme
pkgname="lib32-$_basename"
pkgver=0.6.0
pkgrel=1
pkgdesc="Video game music file emulation/playback library (32-bit)"
url="http://game-music-emu.googlecode.com/"
license=('LGPL')
arch=('x86_64')
depends=('lib32-gcc-libs' 'libgme')
makedepends=('cmake')
source=("https://sources.archlinux.org/other/game-music-emu/game-music-emu-${pkgver}.tar.xz")
md5sums=('b72bc337ea4bd6dab7f0288ed4cd598e')

build() {
  cd "${srcdir}/game-music-emu-${pkgver}"
  mkdir build
  cd build

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/game-music-emu-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  cd "$pkgdir"/usr
  mv lib lib32
  rm -r include
}
