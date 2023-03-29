# Maintainer: Volker Schwaberow <volker@schwaberow.de>

pkgname=rexturl
pkgver=0.2.2
pkgrel=1
pkgdesc="A simple tool in Rust to split urls in their protocol, host, port, path and query parts."
arch=('x86_64')
url="https://github.com/vschwaberow/rexturl"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad0cf2a9b9a9d1b3e1f56a7bfb799fed405e83bf43714827c04441fc736c6088')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/rexturl" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
