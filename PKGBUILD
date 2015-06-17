# Maintainer: Lukas Braun <koomi+aur at hackerspace-bamberg dot de>
# Contributor: David Arroyo <droyo@aqwari.us>
pkgname=s6-musl
pkgver=2.1.0.1
pkgrel=1
pkgdesc="skarnet's small supervision suite."
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/s6"
license=('custom:ISC')
makedepends=('skalibs-musl>=2.2.1.0' 'musl')
depends=('execline-musl>=2.0.2.0')
provides=(s6=2.1.0.1)
options=('staticlibs')
changelog=CHANGELOG
source=("${url}/s6-$pkgver.tar.gz")
sha256sums=('cfe8d67ed70d5b44f4c75f14f077a71160139d994ae45c894cbc11374335eca6')

build() {
  cd "$srcdir/s6-$pkgver"

  export CPPFLAGS='-nostdinc -isystem /usr/lib/musl/include -isystem /usr/include'
  export CC="musl-gcc"
  ./configure --enable-static-libc --bindir=/usr/bin --sbindir=/usr/bin --libexecdir=/usr/lib/s6
  make
}

package() {
  cd "$srcdir/s6-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
