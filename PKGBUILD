# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=scalc
pkgver=0.3.0
pkgrel=1
pkgdesc='A very simple stack-based calculator that aims to be small, flexible, and extensible.'
arch=(x86_64)
url='https://sr.ht/~arivigo/scalc/'
license=('MIT')
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('dcb506a27712c46216a228597dec402c02eb5cb12a02a2ecbcaa00ad6c597164a2778bda7c9dee4e3635cd7bf67d48750b474cf86efd22067481b08bc7dacac6')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
