# Maintainer: jjacky
_pkgname=slicd
pkgname=$_pkgname-musl
pkgver=0.1.0
pkgrel=1
pkgdesc="simple lightweight Linux cron daemon"
arch=('i686' 'x86_64')
url="http://jjacky.com/slicd"
license=('GPL3+')
depends=('musl')
makedepends=('skalibs-musl')
options=('staticlibs')
source=(http://jjacky.com/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('cf57256b9f7216a0143d761982f026c84a13e5908649c9219360ea6ce0f190ad')
provides=($_pkgname)
conflicts=($_pkgname)

build() {
  cd "$_pkgname-$pkgver"

  export CPPFLAGS='-nostdinc -isystem /usr/lib/musl/include -isystem /usr/include'
  export CC="musl-gcc"
  ./configure --bindir=/usr/bin
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
