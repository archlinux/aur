# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=scalc
pkgver=0.2.0
pkgrel=1
pkgdesc='A very simple stack-based calculator that aims to be small, flexible, and extensible.'
arch=(x86_64)
url='https://sr.ht/~arivigo/scalc/'
license=('MIT')
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('cc809dda94a876a42924c7583600dd57b0fe448f404ffea75e2e9639e257bd29bb5c098e02d7813eb2b559939ed39b17c5126fa460e5c5d405b252faddbbbae8')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  sed -i 's/LDFLAGS.*/& -Wl,-z,now/' config.mk
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
