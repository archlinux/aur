# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=scalc
pkgver=0.3.3
pkgrel=1
pkgdesc='A very simple stack-based calculator that aims to be small, flexible, and extensible.'
arch=(x86_64)
url='https://sr.ht/~arivigo/scalc/'
license=('MIT')
depends=(glibc)
makedepends=(sline)
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('1614b1f8ce5b6cd04aec18a014d66e0fab486c004057cf80f0c829ad8e99b0dae30001aa81a06d6c6842b7b04dbfa807f9f49be53e89c6eecc5f23b6f1295848')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
