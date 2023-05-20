# Maintainer: Callum Osmotherly <acheronfail@gmail.com>
pkgname=istat
pkgver=0.1.1
pkgrel=1
pkgdesc="A lightweight and batteries-included status_command for i3 and sway"
arch=('x86_64')
url="https://github.com/acheronfail/istat"
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('cargo' 'clang' 'libpulse')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('13cfca3507b1a537ec6fff6168486c02b896486ff65071926ae6b92a83bfdad426cd2148dd073dff285d9f101d8a7f1821be772ed85e63be0ea584a7395ead88')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/istat" "$pkgdir/usr/bin/istat"
  install -Dm755 "target/release/istat-ipc" "$pkgdir/usr/bin/istat-ipc"
  install -Dm755 "target/release/istat-signals" "$pkgdir/usr/bin/istat-signals"
  install -Dm755 "target/release/istat-sensors" "$pkgdir/usr/bin/istat-sensors"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
