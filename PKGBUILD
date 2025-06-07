# Maintainer: nesk_aur
pkgname=skalibs-musl
pkgver=2.14.4.0
pkgrel=1
pkgdesc="A set of general-purpose C programming libraries"
arch=(aarch64 'i686' 'x86_64')
url="http://www.skarnet.org/software/skalibs"
license=('custom:ISC')
makedepends=(musl)
provides=(skalibs=${pkgver})
replaces=(skalibs)
conflicts=(skalibs)
options=('staticlibs')
source=(${url}/skalibs-$pkgver.tar.gz)
sha256sums=('0e626261848cc920738f92fd50a24c14b21e30306dfed97b8435369f4bae00a5')
build() {
  cd "$srcdir/skalibs-$pkgver"
  CC="musl-gcc" ./configure --disable-shared
  make
}
package() {
  cd "$srcdir/skalibs-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
