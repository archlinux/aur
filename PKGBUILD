pkgname=tempesta
pkgver=0.0.66
pkgrel=1
pkgdesc="The fastest and lightest bookmark manager CLI written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/tempesta"
license=('MIT')
depends=('glibc')
optdepends=('fzf' 'wofi')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/x71c9/$pkgname/tar.gz/refs/tags/v$pkgver")
sha256sums=('2e8236c1916c0f468391b42e11bc14e2db8e03b0ba1d706c2880a18d477c6f90')

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
