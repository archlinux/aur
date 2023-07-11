# Maintainer: AlanChen <chenzunlai@qq.com>

pkgname=translator-rs
pkgver=0.3.3
pkgrel=1
pkgdesc="A simple real-time translator written in Rust. 选中文本即翻译。"
arch=('x86_64')
url="https://github.com/rikonaka/translator-rs"
license=('GPL3')
depends=('xsel' 'libx11' 'libxcb')
makedepends=('rust')
source=("https://github.com/rikonaka/translator-rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(b83c1935fd4951ba11375c9c36b5662a787229d2c3c24bf14d05af58c3848b00)

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
