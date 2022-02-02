# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=sline
pkgver=1.1.1
pkgrel=0
pkgdesc='Simple line-editing and command history library.'
arch=(x86_64)
url='https://sr.ht/~arivigo/sline/'
license=('MIT')
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('b414621fd073131f17dc014141ed8a0e2e70c1a63364dae99d08d81ab6cd1bd75b703c1fbb028641cd5e2ed087f536f673294776a4e30be7dc09656010b4731c')

build() {
  cd "$pkgname-$pkgver"
  sed -i "s/LDFLAGS.*$/&,-z,now/" config.mk
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
