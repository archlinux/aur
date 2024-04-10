# Maintainer: RiverOnVenus <error@zhui.dev>
pkgname=neco-git
pkgver=0.1.0.r1.g8258e56
pkgrel=1
pkgdesc="Concurrency library for C (coroutines)"
arch=(any)
url="https://github.com/tidwall/neco"
license=('MIT')
provides=('libneco.so')
makedepends=('git')
source=("$pkgname-$pkgver"::"git+${url}")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  gcc $CFLAGS -shared -fPIC neco.c -o libneco.so
}

pkgver() {
  cd "$pkgname-$pkgver"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 neco.h "$pkgdir/usr/include/neco.h"
  install -Dm755 libneco.so "$pkgdir/usr/lib/libneco.so"
}
