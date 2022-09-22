# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=scalc
pkgver=2.0.2
pkgrel=1
pkgdesc='A very simple stack-based calculator that aims to be small, flexible, and extensible.'
arch=(x86_64)
url='https://github.com/ariadnavigo/scalc/'
license=('MIT')
depends=(sline)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ariadnavigo/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('7904a022b26a74d7073b1bada8a8885bc34c32d1d7a719b43efd087ab388076940888d2e0978e1187fe1236cef66981a4ff02c2bc5a9818f1a1d0034da1cc89b')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
