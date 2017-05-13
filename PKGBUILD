# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=eternity-engine-git
pkgver=3.42.02.r0.c7e6ea76
pkgrel=1
pkgdesc="An advanced Doom port with vanilla compatibility"
url="http://eternity.youfailit.net/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl' 'sdl_mixer' 'sdl_net' 'zlib')
makedepends=('git' 'cmake')
conflicts=(${pkgname%-git})
source=(${pkgname%-git}::git+https://github.com/team-eternity/eternity.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  # Cannot do in-tree build.
  mkdir ee-build
  cd ee-build
  cmake ../${pkgname%-git} -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ee-build
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
