# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Kaan Kasım <kaankasim88@gmail.com>

pkgname=doomretro-git
pkgver=4.7.2.r328.gb6c99e5fc
pkgrel=1
pkgdesc='The classic, refined DOOM source port (git version)'
arch=('i686' 'x86_64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
makedepends=('cmake' 'git')
optdepends=('timidity++: for music playback')
provides=('doomretro')
conflicts=('doomretro')
source=("git+https://github.com/bradharding/doomretro.git")
sha256sums=('SKIP')

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
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
