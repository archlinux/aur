# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Thomas Lercher <aur@tlercher.de>
# Contributor: NiNjA <heinep at gmail dot com>

pkgname=julius-git
pkgdesc="Open source re-implementation of Caesar III (Original copy required)"
pkgver=1.7.0.r165.g46af932
pkgrel=1
arch=(x86_64 i686)
url="https://github.com/bvschaik/julius"
license=(AGPL-3.0-only)
depends=(sdl2 sdl2_mixer glibc)
makedepends=(git cmake)
provides=(julius julius-game)
conflicts=(julius julius-game)
replaces=(julius-game)
source=("git+https://github.com/bvschaik/julius")
sha256sums=('SKIP')

pkgver() {
  cd "julius"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "julius" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
