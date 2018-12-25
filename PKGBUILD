# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Kaan Kasım <kaankasim88@gmail.com>

pkgname=doomretro-git
pkgver=2.7.5.r172.gb777f28b
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
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
