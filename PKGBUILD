# Maintainer: kryksyh <kryksyh@gmail.com>

pkgname=ttynt
pkgver=0.0.1
pkgrel=1
pkgdesc='A command-line tool for coloring and highlighting text in the terminal based on regex patterns'
arch=(x86_64)
url="https://github.com/kryksyh/$pkgname"
license=(MIT)
depends=()
conflicts=('ttynt-bin')
provides=('ttynt')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6df2e79dda353f9a87ebeaaeb7435df929a642266b833b8a06a99390de12bd1a28d840d72c0934c2e7f11bca1038306985fc5ce72cf89bcd17451b9a22a8b7f8')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
