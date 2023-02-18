# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=protonup-rs
pkgver=0.4.1
pkgrel=1
pkgdesc="CLI program to automate the installation and update of Proton-GE"
arch=('x86_64')
url="https://github.com/auyer/Protonup-rs"
license=('Apache')
depends=('gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d73e8b2ef9cfe5e70d1560851d4000dd0de4ff512634bc10fcbf456f50dafb5e')

prepare() {
  cd "Protonup-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "Protonup-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "Protonup-rs-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
