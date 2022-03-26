# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=scalc
pkgver=1.0.0
pkgrel=0
pkgdesc='A very simple stack-based calculator that aims to be small, flexible, and extensible.'
arch=(x86_64)
url='https://sr.ht/~arivigo/scalc/'
license=('MIT')
depends=(sline)
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('2c9f96b9beea56182fbe7adccf60300a7ee05ecb7108e91ff53dc4e6a2726bd3075141d7957a86fba76d1ef9b96bf394722fbfff56595f0ee7495497eb3ad100')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
