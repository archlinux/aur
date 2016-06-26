# Maintainer: Kaan Kasım <kaankasim88@gmail.com>

pkgname=doom-retro-git
pkgver=r4596.655043e
pkgrel=1
pkgdesc='DOOM Retro is the classic, refined DOOM source port.'
arch=('i686' 'x86_64')
url='http://doomretro.com/'
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer')
makedepends=('cmake' 'git')
provides=('doom-retro')
source=('git://github.com/bradharding/doomretro.git')
md5sums=('SKIP')

pkgver() {
  cd doomretro
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../doomretro \
    -DCMAKE_BUILD_TYPE=Release 
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

}
