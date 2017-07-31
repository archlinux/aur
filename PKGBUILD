# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=doomretro
pkgver=2.5.3
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('i686' 'x86_64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
optdepends=('timidity++: for music playback')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha256sums=('eeb60c00210e5e7ffd4d52a40fd4fa96422553f25a5c97e9c064143ebef142f0')

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
