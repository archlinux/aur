# Maintainer: Gur0v
pkgname=zeptofetch
pkgver=1.0
pkgrel=2
pkgdesc="Blazingly fast, ultra-minimal system information tool for Linux"
arch=('x86_64')
url="https://github.com/Gur0v/zeptofetch"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gur0v/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('940a3a4d384e0a1338bab1fda002c4d195fa83e44969f14469754acb1948eb9a')

build() {
  cd "$pkgname-$pkgver"
  make CFLAGS="-std=c99 -D_POSIX_C_SOURCE=200809L -D_DEFAULT_SOURCE -march=native -O3 -flto -pipe -Wall -Wextra -Wpedantic -ffunction-sections -fdata-sections"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
