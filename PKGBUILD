# Maintainer: Meir Kriheli <mkriheli@gmail.com>
pkgname=rusmux
pkgver=0.7.0
pkgrel=1
pkgdesc="tmux automation tool"
arch=("x86_64")
url="https://github.com/MeirKriheli/rusmux"
license=("MIT")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3619d9c152436a8f4511b6313fdbf69ea4c34523d45e19c0056d3da7c56f3382')

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
