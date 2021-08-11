# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=scalc
pkgver=0.3.4
pkgrel=1
pkgdesc='A very simple stack-based calculator that aims to be small, flexible, and extensible.'
arch=(x86_64)
url='https://sr.ht/~arivigo/scalc/'
license=('MIT')
depends=(glibc)
makedepends=(sline)
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('08603c083ae4ed213de2c151625531e7101dab3f1ca052c848eb4a16d45fe9a4701edcc782fd00fa62159a4fbf277ecc77c9d306c36930ab58f96ec0bd5ad3a8')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
