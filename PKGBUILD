# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=scalc
pkgver=0.3.1
pkgrel=1
pkgdesc='A very simple stack-based calculator that aims to be small, flexible, and extensible.'
arch=(x86_64)
url='https://sr.ht/~arivigo/scalc/'
license=('MIT')
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('01235cf1590420d32bc7af10c0aa442797d4c2d15d9a405fa590bcb1e13adbace5c7368a82b0489d113320a28c798902e07f11b28717efa54a9e75dfea305703')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
