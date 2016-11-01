# Maintainer: jjacky
_pkgname=slicd
pkgname=$_pkgname-musl
pkgver=0.2.0
pkgrel=1
pkgdesc="simple lightweight Linux cron daemon"
arch=('i686' 'x86_64')
url="https://jjacky.com/slicd"
license=('GPL3+')
depends=('musl')
makedepends=('skalibs-musl>=2.4.0.0')
options=('staticlibs')
source=(https://jjacky.com/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('da0d5fb624f3c7e293f49fd83a19a1085c955dbe5c13303da8d3cfe52263ec73')
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
