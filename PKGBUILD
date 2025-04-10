pkgname=tempesta
pkgver=0.0.69
pkgrel=1
pkgdesc="The fastest and lightest bookmark manager CLI written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/tempesta"
license=('MIT')
depends=('glibc')
optdepends=('fzf' 'wofi')
makedepends=('rust' 'cargo')

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/x71c9/$pkgname/tar.gz/refs/tags/v$pkgver")
sha256sums=('cbc5016e1e3f33ce03fab3c8754c33ab6e510137ab8f091a277f95e2b66cf499')

prepare() {
  cd "-"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target ""
}

build() {
  cd "-"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
} 
package() {
  cd "-"
  install -Dm0755 -t "/usr/bin/" "target/release/"
}
