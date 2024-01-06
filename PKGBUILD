# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=freeserf-git
pkgver=0.3_58_g0f1a94f
pkgrel=1
pkgdesc="Opensource Settlers 1 clone (requires original game file)"
arch=('i686' 'x86_64')
url="http://jonls.dk/freeserf/"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer' 'sdl2_image')
makedepends=('git' 'cmake' 'libxmp')
optdepends=('libxmp: Amiga audio playback')
conflicts=('freeserf')
provides=('freeserf')
install=freeserf.install
source=(git+"https://github.com/freeserf/freeserf.git")
md5sums=('SKIP')

pkgver() {
  cd freeserf
  git describe --tags | sed -e 's:^v::' -e 's:-:_:g'
}

build() {
  cmake -B build -DCMAKE_BUILD_TYPE="None" -DCMAKE_INSTALL_PREFIX="/usr" freeserf
  cd build
  make
}

package() {
  cd build
  # CMake install is currently broken (as of 0.2_rc1_318_g6f61d1e) install manually...
  install -Dm755 src/FreeSerf "${pkgdir}/usr/bin/freeserf"
}
