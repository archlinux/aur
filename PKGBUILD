# Maintainer: Ales Katona <almindor@gmail.com>

pkgname="mmapper"
pkgver="24.03.1"
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
source=('https://github.com/MUME/MMapper/archive/refs/tags/v24.03.1.tar.gz')
sha256sums=('c22ebb6aa83847970982682fad52e26a1469212b8703386874b70e1d05eaa994')

prepare() {
  cd "MMapper-${pkgver}"
  mkdir -p build
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
