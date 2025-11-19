# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Based on the PKGBUILD by Sebastian Wolf <fatmike303 at googlemail dot com>

pkgname=yape-git
_pkgname=yapesdl
pkgver=0.80.1.r20.g8737c67
pkgrel=1
pkgdesc="Multiplatform Commodore 64 and 264 family emulator written in C++ using SDL2 - Development version"
arch=(i686 x86_64)
url=https://github.com/calmopyrin/yapesdl
license=(GPL)
makedepends=('git')
depends=(sdl2)
conflicts=(yape)
source=(git+https://github.com/calmopyrin/yapesdl.git)
sha256sums=('SKIP')
options=(!debug)

pkgver() {
  cd "$_pkgname"
  #git describe --long --tags --abbrev=7 | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g'
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-47
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
	install -Dm755 ${srcdir}/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/yape
}

