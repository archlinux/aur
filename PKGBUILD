# Maintainer: rahmerh <rahmerh@users.noreply.github.com>

pkgname=sax
pkgver=1.0.0
pkgrel=2
pkgdesc="A simple but smart archiving and extraction tool"
arch=('x86_64')
url="https://git.sr.ht/~rahmerh/sax"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('sax-git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f18eb645ccabee61364f23cc7eea8e724dc8b781a64127c479de31736750ab54')

prepare() {
  cd "$pkgname-v$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-v$pkgver"

  cargo build --frozen --release
}

check() {
  cd "$pkgname-v$pkgver"

  cargo test --frozen
}

package() {
  cd "$pkgname-v$pkgver"

  install -Dm755 "target/release/sax" "$pkgdir/usr/bin/sax"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
