# Maintainer: Kaan Kasım <kaankasim88@gmail.com>

pkgname=doom-retro-git
pkgver=2.4.5.r356.g06d5feff
pkgrel=1
pkgdesc='The classic, refined DOOM source port.'
arch=('i686' 'x86_64')
url='http://doomretro.com/'
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer')
makedepends=('cmake' 'git')
conflicts=('doomretro')
provides=('doomretro')
source=('git://github.com/bradharding/doomretro.git')
md5sums=('SKIP')

pkgver() {
  cd doomretro
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../doomretro \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
