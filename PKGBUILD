# Maintainer: zsilencer <zsilencergame@gmail.com>
pkgname=zsilencer
pkgver=r52.16f7c7c
pkgrel=1
pkgdesc='Online multiplayer team based CTF 2D game, platformer action.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='http://zsilencer.com'
license=('GPL3')
depends=('sdl2' 'sdl2_mixer' 'zlib')
makedepends=('git' 'cmake')
conflicts=('zsilencer')
provides=('zsilencer')
source=("$pkgname"::'git+https://github.com/zsilencer/zSILENCER.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
  cd "$srcdir/$pkgname/build"

  make DESTDIR="$pkgdir" install
}