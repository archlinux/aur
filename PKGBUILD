# Maintainer: Ales Katona <almindor@gmail.com>

pkgname="mmapper"
pkgver="25.07.0"
pkgrel="1"
pkgdesc="MMapper2 is a MUD (Multi-User Dungeon) mapper especially written for the MUD MUME"
arch=('x86_64')
url='https://github.com/MUME/MMapper'
license=('GPL2')
depends=('qt5-base' 'openssl' 'zlib')
makedepends=('cmake')
optdepends=()
provides=('mmapper')
replaces=()
conflicts=()
options=(strip)
source=('https://github.com/MUME/MMapper/archive/refs/tags/v25.07.0.tar.gz')
sha256sums=('7e6921af6927cf3fecca2a5979b0e4df4356fa45527b64810da62cf36cb23456')

prepare() {
  cd "MMapper-${pkgver}"
  mkdir -p build
  patch -Np1 -i ../../fixes.patch
}

build() {
  cd "MMapper-${pkgver}/build"
  cmake -S .. -DCMAKE_INSTALL_PREFIX=/usr -DWITH_MINIUPNPC=OFF
  make
}

check() {
  cd "MMapper-${pkgver}/build"
  make test
}

package() {
  cd "MMapper-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
