# Maintainer: Volker Schwaberow <volker@schwaberow.de>

pkgname=rustgenhash
pkgver=0.7.1
pkgrel=2
pkgdesc="A toolkit to generate and analyze hashes"
arch=('x86_64')
url="https://github.com/vschwaberow/rustgenhash"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7509a920c381538769413fab433b4309de83d23eda50f3670b4f0b886fa06357')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
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
  install -Dm 755 "target/release/rgh" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
