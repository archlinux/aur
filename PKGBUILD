# Maintainer: AlanChen <chenzunlai@qq.com>

pkgname=translator-rs
pkgver=0.3.6
pkgrel=1
pkgdesc="A simple real-time translator written in Rust. 选中文本即翻译。"
arch=('x86_64')
url="https://github.com/rikonaka/translator-rs"
license=('GPL3')
depends=('xsel' 'libx11' 'libxcb')
makedepends=('rust')
source=("https://github.com/rikonaka/translator-rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(81810611654b73a25334baa461dd1e71da8d254c0a8be05beed42ddc2341b19f)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --offline --target x86_64-unknown-linux-gnu
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --target x86_64-unknown-linux-gnu
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/x86_64-unknown-linux-gnu/release/translator-rs"
}
