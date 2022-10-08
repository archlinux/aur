# Maintainer: Ales Katona <almindor@gmail.com>

pkgname="mmapper"
pkgver="22.05.0"
pkgrel="1"
pkgdesc="MMapper2 is a MUD (Multi-User Dungeon) mapper especially written for the MUD MUME"
arch=('x86_64')
url='https://github.com/MUME/MMapper'
license=('GPL2')
depends=('qt5-base')
makedepends=('cmake')
optdepends=()
provides=('mmapper')
replaces=()
conflicts=()
options=(strip)
source=('https://github.com/MUME/MMapper/archive/refs/tags/v22.05.0.tar.gz')
sha256sums=('23916a2a7516d7c230e78d075218e8f71225f5cccf26a10f03f8cbef735da76e')

prepare() {
  cd "MMapper-${pkgver}"
  mkdir -p build
}

build() {
  cd "MMapper-${pkgver}/build"
  cmake -S .. -DCMAKE_INSTALL_PREFIX=/usr
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
