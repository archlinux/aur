# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=doomretro
pkgver=2.5
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('i686' 'x86_64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
optdepends=('timidity++: for music playback')
makedepends=('cmake')
conflicts=('doom-retro-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz"
        "$pkgname.patch::https://github.com/bradharding/doomretro/commit/0765653715300d00607fded92a954504174c7d1b.patch")
sha256sums=('1975331cd45657453f80410ce8235715da07023f03565d8ec0e39e9f9b32d948'
            '363ea8a3165b957eeb6e192ca6b6afc5d86a414024de21c097946d1089ba49bf')

prepare() {
  mkdir -p build

  # add upstream patch for CMakeLists.txt
  patch -p1 -i ../doomretro.patch -d $pkgname-$pkgver
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
