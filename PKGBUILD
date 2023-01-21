# Maintainer: Steven Guikal <aur-void@fluix.one>
# Co-Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=scalc
pkgver=2.0.3
pkgrel=1
pkgdesc='A very simple stack-based calculator that aims to be small, flexible, and extensible.'
arch=(x86_64)
url='https://github.com/ariadnavigo/scalc/'
license=('MIT')
depends=(sline)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ariadnavigo/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('2656c2027b3ea53785d11545e068a8d0124a04d25fdede800dbbd4b6deb58547125962abd0d2c8befda836185d95024d616799a63d384f604c9c0aa36ed4469e')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
