# Maintainer: Tricia, `creyon` <gtcreyon@gmail.com>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas
pkgver=1.4.7
pkgrel=1
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'ffmpeg' 'fontconfig' 'freetype2' 'hicolor-icon-theme'
         'lua' 'qt5-base' 'sdl2' 'xcb-util-cursor' 'zlib')
optdepends=('lib32-libtas: for 32-bit games support')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('052c781ef4e3fa00d047462ec9b375b528db7cbb4bd8a96cdb7c9f793be85736a9c3193c53fd5e4b5b0bb8b5d6b29bf0b12b1bfeafd94c451de1db1ed9c6f7bb')

prepare() {
  cd libTAS-$pkgver

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  autoreconf -i
}

build() {
  cd "libTAS-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "libTAS-$pkgver"

  make DESTDIR="$pkgdir/" install
}
