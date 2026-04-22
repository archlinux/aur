# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonup-rs
pkgver=0.12.0
pkgrel=1
pkgdesc="Automate the installation and update of Linux Gaming Compatibility tools"
arch=('x86_64')
url="https://github.com/auyer/Protonup-rs"
license=('Apache-2.0')
depends=(
  'glibc'
  'xz'
)
makedepends=('cargo')
source=("Protonup-rs-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8d87d8b7729feea70b23fc91ec0ca0427be3c52d5c542e9dfa41e6111c648c33')

prepare() {
  cd "Protonup-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "Protonup-rs-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "Protonup-rs-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
