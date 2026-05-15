# Maintainer: Uzanto
pkgname=pingall
pkgver=2.1.1
pkgrel=1
pkgdesc='Ping everything you can reach'
arch=('x86_64')
url='https://github.com/Fierthraix/pingall'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'iputils')
makedepends=('cargo')
optdepends=('avahi: resolve hostnames via avahi-resolve')
source=("$pkgname-$pkgver.crate::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('6a7e61f9c85fd51a83d63454515390b627b6505dc6b46bd53a304da4a4c9bd6a')

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
