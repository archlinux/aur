# Maintainer: David Pedersen <limero@me.com>
pkgname=phoenix-git
_gitname=Phoenix
pkgver=r1136.67586b5
pkgrel=3
pkgdesc="A super-slick libretro frontend powered by Qt 5"
arch=('i686' 'x86_64')
url="https://github.com/team-phoenix/Phoenix"
license=('GPL')
depends=('sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-svg')
makedepends=('git')
optdepends=('libretro-bsnes' 'libretro-gambatte' 'libretro-genesis-plus-gx' 'libretro-mgba' 'libretro-nestopia' 'libretro-snes9x')
provides=('phoenix')
conflicts=('phoenix')
source=("git+https://github.com/team-phoenix/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_gitname"

	git submodule update --init --recursive
}

build() {
  cd "$_gitname"

  qmake ../Phoenix PREFIX="$pkgdir"/usr
  make
}

package() {
  cd "$_gitname"

  make install
}
