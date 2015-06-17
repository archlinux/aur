# Maintainer: Lukas Braun <koomi+aur at hackerspace-bamberg dot de>
pkgname=s6-dns-musl
pkgver=2.0.0.2
pkgrel=1
pkgdesc="A suite of DNS client programs and libraries for Unix systems."
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/s6-dns"
license=('custom:ISC')
makedepends=('musl' 'skalibs-musl>=2.2.0.0')
provides=('s6-dns=2.0.0.2')
options=('staticlibs')
changelog=CHANGELOG
source=(${url}/s6-dns-$pkgver.tar.gz)
sha256sums=('b28bbb40b03eb276aed352ab4a7a515615ba0d45029b6688c1dcda86fe3030e8')

build() {
  cd "$srcdir/s6-dns-$pkgver"

  CC="musl-gcc" ./configure --enable-static-libc --with-include=/usr/include --bindir=/usr/bin
  make
}

package() {
  cd "$srcdir/s6-dns-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
