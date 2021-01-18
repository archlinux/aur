# Maintainer: Corwin <corwin@kuiper.dev>

pkgname=melonds
pkgver=0.9.1
pkgdesc='DS emulator, sorta'
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://melonds.kuribo64.net/"
license=('GPLv3')
makedepends=('cmake' 'pkg-config')
depends=('sdl2' 'libslirp' 'qt5-base')
source=("https://github.com/Arisotura/melonDS/archive/$pkgver.tar.gz")

sha256sums=('9c7253a8c9bdd1270c142077eaa3a830176eef42123c72dc68cb1d4abd2d43a6')

build() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
  cd build
  cmake ../melonDS-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make VERBOSE=ON
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}