# Maintainer: Lukas Braun <koomi+aur at hackerspace-bamberg dot de>
pkgname=s6-networking-musl
pkgver=2.1.0.0
pkgrel=1
pkgdesc="A suite of small networking utilities for Unix systems.."
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/s6-networking"
license=('custom:ISC')
makedepends=(musl 'skalibs-musl>=2.2.0.0' 's6-dns-musl>=2.0.0.2')
depends=('execline-musl>=2.0.2.0' 's6-musl>=2.1.0.0')
provides=('s6-networking=2.1.0.0')
options=('staticlibs')
changelog=CHANGELOG
source=(${url}/s6-networking-$pkgver.tar.gz)
sha256sums=('be75bddad884287c442900e10417c63980788ca1c5bae4188b64b375efba734d')

build() {
  cd "$srcdir/s6-networking-$pkgver"

  unset CFLAGS
  unset LDFLAGS
  export CPPFLAGS='-nostdinc -isystem /usr/lib/musl/include -isystem /usr/include'
  export CC='musl-gcc'
  ./configure --enable-static-libc --bindir=/usr/bin
  make
}

package() {
  cd "$srcdir/s6-networking-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
