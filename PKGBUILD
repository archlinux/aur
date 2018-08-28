# Maintainer: Christoph J. Thompson <thompsonc at protonmail dot ch>

pkgname=freeblocks-git
pkgver=r193.gfa7088c
pkgrel=2
pkgdesc="Tetris Attack-like puzzle game"
arch=('i686' 'x86_64')
url="https://github.com/dorkster/freeblocks"
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('git' 'cmake')
conflicts=('freeblocks')
provides=('freeblocks')
replaces=('freeblocks')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  cmake \
   -DCMAKE_C_FLAGS="${CFLAGS}" \
   -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
