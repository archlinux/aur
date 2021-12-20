# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=scalc
pkgver=0.4.0
pkgrel=0
pkgdesc='A very simple stack-based calculator that aims to be small, flexible, and extensible.'
arch=(x86_64)
url='https://sr.ht/~arivigo/scalc/'
license=('MIT')
depends=(sline)
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('2447ed28e6ceda27230ba6bd55d1970c4f48f9f38b74e73d933296d59d40c9ef0e8b7715266ff5088a4b1ebdfa69064298f4009895549af659942d7734dd1263')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
