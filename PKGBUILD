# Maintainer: Volker Schwaberow <volker@schwaberow.de>

pkgname=rprobe
pkgver=0.5.5
pkgrel=1
pkgdesc="A tool in Rust that can check which HTTP or HTTPS hosts are online"
arch=('x86_64')
url="https://github.com/vschwaberow/rprobe"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0cb320bcba6ef5ff432dfc202bb98d0c6b08ab2e4772e5533c06e33191695cc4')
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
  install -Dm 755 "target/release/rprobe" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
