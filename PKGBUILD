# Maintainer: Corwin <corwin@kuiper.dev>

pkgname=melonds
pkgver=0.9.2
pkgdesc='DS emulator, sorta'
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://melonds.kuribo64.net/"
license=('GPLv3')
makedepends=('cmake' 'pkg-config')
depends=('sdl2' 'libslirp' 'qt5-base' 'libepoxy')
source=("https://github.com/Arisotura/melonDS/archive/$pkgver.tar.gz")

sha256sums=('e9f408efa996dda4236a17340f024fea11fd98054148d37cf5b17fea8a2f63ad')

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