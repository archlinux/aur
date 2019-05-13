# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=curvedns
pkgver=0.87
pkgrel=2
pkgdesc="A DNSCurve forwarding name server"
arch=('i686' 'x86_64')
url="https://github.com/curvedns/curvedns"
license=('BSD')
depends=('glibc' 'libev')
source=("https://github.com/curvedns/curvedns/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('9f45d0324d2917dd93546b0af74428ff50e06293fd4c273b7e5f6b62f88d9e6a')

build() {
  cd "$pkgname-$pkgname-$pkgver"

  ./configure.nacl

  ./configure.curvedns
  echo "$CFLAGS" > "nacl/build/work/curvedns/cflags"
  ./configure.curvedns
  make
}

package() {
  cd "$pkgname-$pkgname-$pkgver"

  install -Dm755 "curvedns" "$pkgdir/usr/bin/curvedns"
  install -Dm755 "curvedns-keygen" "$pkgdir/usr/bin/curvedns-keygen"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
