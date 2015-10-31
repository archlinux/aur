# Maintainer: David Pedersen <limero@me.com>
pkgname=phoenix-git
_gitname=Phoenix
pkgver=r969.f3a590a
pkgrel=1
pkgdesc="A super-slick libretro frontend powered by Qt 5"
arch=('i686' 'x86_64')
url="https://github.com/team-phoenix/Phoenix"
license=('GPL')
depends=('sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-svg')
makedepends=('git')
provides=('phoenix')
conflicts=('phoenix')
source=("git+https://github.com/team-phoenix/$_gitname.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"

  git submodule init
  git submodule update

  qmake ../Phoenix PREFIX="$pkgdir"/usr
  make
}

package() {
  cd "$_gitname"

  make install
}
