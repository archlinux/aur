# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas
pkgver=1.4.3
pkgrel=1
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('alsa-lib' 'ffmpeg' 'fontconfig' 'freetype2' 'hicolor-icon-theme'
         'lua' 'qt5-base' 'sdl2' 'xcb-util-cursor' 'zlib')
optdepends=('lib32-libtas: for 32-bit games support')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('2f514b74ac4e3d915198fc88e70d495d1cf9a2f794e7a4416089d876a246d9b593278a0e4d2e7604d486b11033a4d1e7cc884dad208938d9075ffc63dc1ef11c')

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
