# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=zlib-git
pkgver=1.3.1.r50.g0f51fb4
pkgrel=1
pkgdesc="A massively spiffy yet delicately unobtrusive compression library (git develop branch)"
arch=('i686' 'x86_64')
url="https://www.zlib.net/"
license=('Zlib')
depends=('glibc')
makedepends=('git')
provides=("zlib=$pkgver" 'libz.so')
conflicts=('zlib')
options=('staticlibs')
source=("git+https://github.com/madler/zlib.git#branch=develop")
sha256sums=('SKIP')


pkgver() {
  cd "zlib"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "zlib"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "zlib"

  #make test
}

package() {
  cd "zlib"

  make DESTDIR="$pkgdir" install

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/zlib"
}
