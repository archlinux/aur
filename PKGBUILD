# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas-git
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
pkgver=1.4.1.r9.ac432d4
pkgrel=1
epoch=1
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('alsa-lib' 'fontconfig' 'ffmpeg' 'freetype2' 'hicolor-icon-theme'
         'qt5-base' 'sdl2' 'xcb-util-cursor' 'zlib')
makedepends=('git')
optdepends=('lib32-libtas-git: for 32-bit games support')
conflicts=('libtas')
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

  ./configure --prefix=/usr
  make
}

package() {
  cd "libTAS"

  make DESTDIR="$pkgdir/" install
}
