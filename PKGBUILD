# Maintainer: RiverOnVenus <error@zhui.dev>
pkgname=neco-git
pkgver=r1.ee209f7
pkgrel=1
pkgdesc="Concurrency library for C (coroutines)"
arch=(any)
url="https://github.com/tidwall/neco"
license=('MIT')
provides=("libneco.so=$pkgver")
makedepends=('git')
source=("$pkgname-$pkgver"::"git+${url}")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cc neco.c -shared -fPIC -o libneco.so
}

pkgver() {
  cd "$pkgname-$pkgver"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 neco.h "$pkgdir/usr/include/neco.h"
  install -Dm755 libneco.so "$pkgdir/usr/lib/libneco.so"
}
