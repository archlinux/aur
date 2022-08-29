# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=scalc
pkgver=2.0.0
pkgrel=2
pkgdesc='A very simple stack-based calculator that aims to be small, flexible, and extensible.'
arch=(x86_64)
url='https://github.com/ariadnavigo/scalc/'
license=('MIT')
depends=(sline)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ariadnavigo/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('1e744dec07775bf5802df18f8080fa707b8eb2ade8cda0a36957a71850996287169b96c102347bd00363484b20afcf18b5337470e8f3f936d346def2d0bb88c1')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
