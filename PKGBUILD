# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=lib32-libtas-git
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries (32-bit support)"
pkgver=1.4.1.r9.ac432d4
pkgrel=1
epoch=1
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('lib32-alsa-lib' 'lib32-ffmpeg' 'lib32-fontconfig'
         'lib32-freetype2' 'lib32-libx11' 'lib32-sdl2' 'libtas-git' 'lib32-zlib')
makedepends=('git')
conflicts=('lib32-libtas')
source=("git+$url")
b2sums=(SKIP)

pkgver() {
  cd "libTAS"

  printf %s "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//g')"
}

prepare() {
  cd "libTAS"

  autoreconf -i
}

build() {
  cd "libTAS"

  ./configure --prefix=/usr --enable-i386-lib
  make
}

package() {
  cd "libTAS"

  make DESTDIR="$pkgdir/" install
}
