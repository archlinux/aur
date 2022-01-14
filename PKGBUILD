# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=doomretro
pkgver=4.4.2
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('x86_64' 'aarch64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer' 'glibc')
makedepends=('cmake')
optdepends=('timidity++: for music playback')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha512sums=('27311c71e360c79103b803fd1a55cc18799f62b56740d6c04739673725435d5b43c032e5de498408ba2673b6364779bd918344af07c0ea6a9ee7abd6179fa494')
b2sums=('638755a5331df50fe318aeb7c7c247dbf2972e34e7ebf513c3ea8c8b2067cc1dd42770fcacf37fc761deb097b329653b26d44c02153661dfd64d16da5f32c5e6')

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
