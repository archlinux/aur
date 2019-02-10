# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas-git
pkgver=1.3.3.r1.5ca20a5
pkgrel=1
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('alsa-lib' 'ffmpeg' 'fontconfig' 'freetype2'
         'qt5-base' 'xcb-util-cursor' 'zlib')
makedepends=('cmake' 'extra-cmake-modules')
conflicts=('libtas')
source=("git+$url")
sha512sums=(SKIP)

pkgver() {
  cd "libTAS"

  printf %s "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//g')"
}

build() {
  cd "libTAS"

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "libTAS/build"

  make DESTDIR="$pkgdir/" install
}
