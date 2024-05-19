# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonup-rs
pkgver=0.8.1
pkgrel=1
pkgdesc="CLI program to automate the installation and update of Proton-GE"
arch=('x86_64')
url="https://github.com/auyer/Protonup-rs"
license=('Apache-2.0')
depends=('glibc' 'xz')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('55af8848f0f4949b3101f03353dc0f5825eae69f34cd607a00692bc56bc5802c')

prepare() {
  cd "Protonup-rs-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "Protonup-rs-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features
}

package() {
  cd "Protonup-rs-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
