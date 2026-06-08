# Maintainer: rahmerh <rahmerh@users.noreply.github.com>

pkgname=sax
pkgver=1.0.0
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
sha256sums=('d1111a7f4f2b69ac4b2598d13f3fe64c4d196451008e307b1d5c1e96379a00a2')

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
