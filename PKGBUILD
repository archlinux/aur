# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nettle-git
pkgver=3.7.r2.g62dc4ce4
pkgrel=1
pkgdesc="A cryptographic library that is designed to fit easily in any context"
arch=('i686' 'x86_64')
url="https://www.lysator.liu.se/~nisse/nettle/"
license=('GPL' 'LGPL')
depends=('glibc' 'gmp')
makedepends=('git')
provides=('nettle' 'libhogweed.so' 'libnettle.so')
conflicts=('nettle')
source=("git+https://git.lysator.liu.se/nettle/nettle.git")
sha256sums=('SKIP')


pkgver() {
  cd "nettle"

  git describe --long --tags | sed 's/^[_a-z]*\([0-9.]*\)[^-]*/\1/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "nettle"

  ./.bootstrap
  ./configure \
    --prefix="/usr" \
    --disable-documentation
  make
}

check() {
  cd "nettle"

  make check
}

package() {
  cd "nettle"

  make DESTDIR="$pkgdir" install
}
