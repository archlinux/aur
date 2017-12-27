# Maintainer: Fabien Valthier <hcoohb @g*ail.com>

_gitname=mjpg-streamer
pkgname=$_gitname-jacksonliam-git
pkgver=r299.c1ecfaf
pkgrel=1
arch=(x86_64)
pkgdesc="Stream mjpeg frames from a webcam via http. Newer forked code."
url="https://github.com/jacksonliam/mjpg-streamer"
license=(GPL)
groups=(multimedia)
depends=(libjpeg imagemagick)
makedepends=(extra-cmake-modules git gcc)
provides=(mjpeg-streamer mjpg-streamer)
conflicts=('mjpg-streamer mjpeg-streamer')
options=(!makeflags)
source=("git+https://github.com/jacksonliam/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname/mjpg-streamer-experimental"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname/mjpg-streamer-experimental \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd build
  make DESTDIR="$pkgdir" install
  install -m 644 $srcdir/$_gitname/mjpg-streamer-experimental/LICENSE $srcdir/$_gitname/mjpg-streamer-experimental/README.md $srcdir/$_gitname/mjpg-streamer-experimental/start.sh $pkgdir/usr/share/$_gitname/
}
