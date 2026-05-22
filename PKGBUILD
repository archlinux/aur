# Maintainer: Rui Jiang <https://github.com/ruiiiijiiiiang>
pkgname=rs-top
pkgver=0.1.2
pkgrel=2
pkgdesc="A lightweight, agentless, and read-only remote system monitor with a TUI dashboard"
arch=('x86_64')
url="https://github.com/ruiiiijiiiiang/rs-top"
license=('MIT')
depends=('gcc-libs' 'openssh')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('20e45f2cad11c530e3c5ffd6285f0aa8af27b3a182ae819304ce644bfd9eb31e')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
