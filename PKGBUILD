# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=doomretro
pkgver=2.6.5
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('i686' 'x86_64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
makedepends=('cmake')
optdepends=('timidity++: for music playback')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha256sums=('d0a3a008e2899b10d26ee7b695f8d3ad0cf3f9ea8c6e5fbe2f7b0e5f0bb2e39c')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
