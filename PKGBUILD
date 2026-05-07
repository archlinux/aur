# Maintainer: Uzanto
pkgname=pingall
pkgver=1.0.1
pkgrel=1
pkgdesc='Ping everything you can reach'
arch=('x86_64')
url='https://github.com/Fierthraix/pingall'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'iputils')
makedepends=('cargo')
optdepends=('avahi: resolve hostnames via avahi-resolve')
source=("$pkgname-$pkgver.crate::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('d5d518b897c94a47342b642e8ec01659d38e1911ae15470cc16cd216579fc60e')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
