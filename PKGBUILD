# Maintainer: rahmerh <rahmerh@users.noreply.github.com>

pkgname=sax
pkgver=0.3.0
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
sha256sums=('31f0e028ba97c0ffecacccdf9c2dd4c3a194126ddd8ee4f855c629add9421f6c')

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
