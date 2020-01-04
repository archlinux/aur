# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=doomretro
pkgver=3.4
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('x86_64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
makedepends=('cmake')
optdepends=('timidity++: for music playback')
noextract=("$pkgname-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha512sums=('b26158e8c261cae90a79e3abee7ee912d580af4ebfcf61a60317c18c7dba39afa8025f48c68c58d04b9ed7fdddc493c7ab756fd4c273d1c9c1b47306fda53e20')

prepare() {
  # 3.2 and later versions can't be extracted by bsdtar
  tar xf "$pkgname-$pkgver.tar.gz"
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
