# Maintainer: rahmerh <rahmerh@users.noreply.github.com>

pkgname=sax
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple but smart archiving and extraction tool"
arch=('x86_64')
url="https://github.com/rahmerh/sax"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('sax-git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d51566d5ba0259603b976ac4b0ec49c9a78639437e9c66f9ed6e6d75431da39d')

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

  install -Dm755 "target/release/sax" "$pkgdir/usr/bin/sax"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
