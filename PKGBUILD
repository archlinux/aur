# Maintainer: Misano <me@mirsobhan.ir>

pkgname=anarch
pkgver=0.1.0
pkgrel=1
pkgdesc="archlinux conf manger"
arch=('x86_64' 'aarch64')
url="https://github.com/mirs0bhan/Anarch"
license=('custom')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  # Install the binary
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"

  # Install documentation
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  # Install license
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

pkgname="anarch"
pkgver="0.1.0"
pkgdesc="Archlinux conf manager"
arch=("x86_64")
depends=("cargo")
license=("GPL3")
