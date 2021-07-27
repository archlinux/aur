# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=scalc
pkgver=0.3.2
pkgrel=1
pkgdesc='A very simple stack-based calculator that aims to be small, flexible, and extensible.'
arch=(x86_64)
url='https://sr.ht/~arivigo/scalc/'
license=('MIT')
depends=(glibc)
makedepends=(sline)
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('c76360e054d450eb4f891fbe6f8e3c26e1999231114ac00e1b2a0b6e075fc272242eba55bb59c5ce6d22cea2796e3de5d630657f225d0c95898562f7ffddcfec')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
