# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas
pkgver=1.3.3
pkgrel=3
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('alsa-lib' 'ffmpeg' 'fontconfig' 'freetype2'
         'qt5-base' 'xcb-util-cursor' 'zlib')
makedepends=('cmake' 'extra-cmake-modules')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('40e54635fc3b42ead6466a703bbef3d90e94fa20e7a4a953e544248327a2a0a3e482703007d79bca518472ea084b9b104c001aa81ad6274995c47f588c9047f8')

prepare() {
  cd libTAS-$pkgver

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "libTAS-$pkgver"

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "libTAS-$pkgver/build"

  make DESTDIR="$pkgdir/" install
}
