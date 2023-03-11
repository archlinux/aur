# Maintainer: Volker Schwaberow <volker@schwaberow.de>

pkgname=rustgenhash
pkgver=0.7.0
pkgrel=1
pkgdesc="A toolkit to generate and analyze hashes"
arch=('x86_64')
url="https://github.com/vschwaberow/rustgenhash"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a3f3a2e6e1cc304a2ddbdf4f8a261254576b2d95d0064806fcefacd0142a9392')
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
  install -Dm 755 "target/release/rgh" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
