# Maintainer: jjacky
_pkgname=anopa
pkgname=$_pkgname-musl
pkgver=0.3.0
pkgrel=1
pkgdesc="init system/service manager built around s6 supervision suite [musl]"
arch=('i686' 'x86_64')
url="http://jjacky.com/anopa"
license=('GPL3+')
depends=('execline-musl' 's6-musl')
makedepends=('musl' 'skalibs-musl')
options=('staticlibs')
source=(http://jjacky.com/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('1f1891c063b5f4fc3a0c42d1e61411c2f6d6bfb64d3b84c4295acc78af85a72a')
provides=($_pkgname)
conflicts=($_pkgname)

build() {
  cd "$_pkgname-$pkgver"

  export CPPFLAGS='-nostdinc -isystem /usr/lib/musl/include -isystem /usr/include'
  export CC="musl-gcc"
  ./configure --enable-static-libc --bindir=/usr/bin --libexecdir=/usr/lib/anopa
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
