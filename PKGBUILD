# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas-git
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
pkgver=1.4.0.r0.33fc75b
pkgrel=1
epoch=1
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('alsa-lib' 'fontconfig' 'freetype2'
         'qt5-base' 'xcb-util-cursor' 'zlib')
makedepends=('git')
optdepends=('lib32-libtas-git: for 32-bit games support')
conflicts=('libtas')
source=("git+$url")
sha512sums=(SKIP)

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
