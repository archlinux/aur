# Maintainer: Meir Kriheli <mkriheli@gmail.com>
pkgname=rusmux
pkgver=0.3.7
pkgrel=1
pkgdesc="tmux automation tool"
arch=("x86_64")
url="https://github.com/MeirKriheli/rusmux"
license=("MIT")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("cafcea0e3604f7f48a4a40fccd070a6a2e971d788146c77eb23fd51aced8d8bc")

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
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
