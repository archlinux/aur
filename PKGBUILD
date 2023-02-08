# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

## TODO: Split package
#pkgname=('protonup-rs' 'libprotonup' 'protonup-gui')

pkgname=protonup-rs
pkgbase=protonup-rs
pkgver=0.3.0
pkgrel=1
pkgdesc="Install and Update Proton-GE with Rust"
arch=('x86_64')
url="https://github.com/auyer/Protonup-rs"
license=('Apache')
depends=('gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d3aa08dac1fa6d50ab282dd3aebf3f07d9bbc644d17083eec85fc5112d44bd23')

prepare() {
  cd "Protonup-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "Protonup-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build -p protonup-rs --release
#  cargo build -p libprotonup --release
#  cargo build -p protonup-gui --release
}

package_protonup-rs() {
  cd "Protonup-rs-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}

#package_libprotonup() {
#  cd "Protonup-rs-$pkgver"
#  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
#}

#package_protonup-gui() {
#  cd "Protonup-rs-$pkgver"
#  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
#}
