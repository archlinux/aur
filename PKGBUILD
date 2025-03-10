# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=wgsl-analyzer
pkgver=0.9.8
pkgrel=2
pkgdesc='A language server for the WGSL shading language'
url='https://github.com/wgsl-analyzer/wgsl-analyzer'
source=("wgsl-analyzer-${pkgver}.tar.gz::https://github.com/wgsl-analyzer/wgsl-analyzer/archive/refs/tags/v${pkgver}.tar.gz")
arch=('x86_64' 'aarch64')
license=('MIT' 'APACHE')
makedepends=('cargo')
conflicts=('wgsl-analyzer')
provides=('wgsl-analyzer')
sha256sums=('176c9d439aff604477265efac49790cd1a231781da2193c5fe358cdc2e5b217a')

prepare() {
  cd "wgsl-analyzer-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "wgsl-analyzer-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p wgsl-analyzer
}

check() {
  cd "wgsl-analyzer-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features -p wgsl-analyzer
}

package() {
  cd "wgsl-analyzer-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/wgsl-analyzer"
}
