# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas
pkgver=1.3.4
pkgrel=2
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('alsa-lib' 'ffmpeg' 'fontconfig' 'freetype2'
         'qt5-base' 'xcb-util-cursor' 'zlib')
makedepends=('cmake' 'extra-cmake-modules')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('cb1baaa9ef90b6ff85130732bbaf27093b52b7792d47779838a367648ae05500095afb262fd363369b50012e91da3c121d0e5aca0c58b5ea2fa32fd55b476c79')

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
