# Maintainer: fiatjaf <fiatjaf@gmail.com>

pkgname=hal-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="hal - the Bitcoin companion"
arch=('x86_64')
url="https://github.com/stevenroose/hal"
license=('CC0-1.0')
depends=('gcc-libs')
makedepends=('cargo')
provides=('hal')
conflicts=('hal')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stevenroose/hal/releases/download/v$pkgver/hal-$pkgver-vendored.tar.gz")
sha256sums=('31dc6b845b8b6b776b28903b51513f1f2b565ebbf77865dfb21db5730a6247a7')

build() {
  cd "$srcdir"
  export CARGO_NET_OFFLINE=true
  cargo build --release --frozen --offline
}

package() {
  cd "$srcdir"
  install -Dm755 "target/release/hal" "$pkgdir/usr/bin/hal"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
