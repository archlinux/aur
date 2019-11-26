# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas
pkgver=1.3.5
pkgrel=1
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('alsa-lib' 'ffmpeg' 'fontconfig' 'freetype2'
         'qt5-base' 'xcb-util-cursor' 'zlib')
optdepends=('lib32-libtas: for 32-bit games support')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ea2601b0790bf705b7552cf479ca04d04bef156e55f63558df37e4217c3b56a81950d3b5d37351a6782b205c37f49f95c0fbeac7a33b3da3f9a3278408926911')

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
