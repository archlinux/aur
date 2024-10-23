# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Thomas Lercher <aur@tlercher.de>
# Contributor: NiNjA <heinep at gmail dot com>

pkgname=augustus-git
pkgdesc="An enhanced re-implementation of Caesar III (Original copy required)"
pkgver=4.0.0.r415.gb47ce83
pkgrel=1
arch=(x86_64 i686)
url="https://github.com/Keriew/augustus"
license=(AGPL-3.0-only)
depends=(sdl2 sdl2_mixer glibc)
makedepends=(git cmake)
provides=(augustus)
conflicts=(augustus augustus-game)
replaces=(augustus-game)
source=("git+https://github.com/Keriew/augustus.git")
sha256sums=('SKIP')

pkgver() {
  cd "augustus"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "augustus" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
