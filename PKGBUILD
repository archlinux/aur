# Maintainer: RiverOnVenus <error@zhui.dev>
pkgname=neco-git
pkgver=0.2.0.r0.ge7a1b30
pkgrel=1
pkgdesc="Concurrency library for C (coroutines)"
arch=('x86_64')
url="https://github.com/tidwall/neco"
license=('MIT')
provides=('libneco.so')
depends=('glibc' 'gcc-libs')
makedepends=('git')
source=("$pkgname"::"git+${url}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  gcc $CFLAGS $LDFLAGS -shared -fPIC neco.c -o libneco.so
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname/neco.h" "$pkgdir/usr/include/neco.h"
  install -Dm755 "$srcdir/$pkgname/libneco.so" "$pkgdir/usr/lib/libneco.so"
}
