# Maintainer: Michael Cortese <mcortese1406@gmail.com>
pkgname=kuva
pkgver=0.1.2
pkgrel=3
pkgdesc="Scientific plotting library in Rust with various backends."
arch=('x86_64')
url="https://github.com/Psy-Fer/kuva"
license=('MIT')
# depends=('')
makedepends=('rust')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Psy-Fer/kuva/archive/refs/tags/v$pkgver.tar.gz")

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --features cli
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('4b29ecb8c098b8d3c98098aafc3ad45e3800362bd383a07a980b59333455ddc8')
