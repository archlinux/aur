# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=doomretro
pkgver=3.2.1
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
sha512sums=('baf2e1fc5a9ead73a0da38c495e5ce5d215a930b252881eec3c73a6f2b0f863488bc6f7dc050d4d745dd9c27e61223353b8d9d29d51a9ab9b7be7816459bbd49')

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
