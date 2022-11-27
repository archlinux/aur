# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas
pkgver=1.4.4
pkgrel=1
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('alsa-lib' 'ffmpeg' 'fontconfig' 'freetype2' 'hicolor-icon-theme'
         'lua' 'qt5-base' 'sdl2' 'xcb-util-cursor' 'zlib')
optdepends=('lib32-libtas: for 32-bit games support')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('8f2e2d30ee5900aa7d25f783179f1d082f51bcbd4622e4b342f5461d6f2051845289f516ebfd29961173fcd68976c9e434d7f0db4a5e85760545ec1d14a925ca')

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
