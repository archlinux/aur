# Maintainer: Kino <cybao292261@163.com>
# Contributor: Mattia Ronchi <ronchimattia03 at gmail dot com>

pkgname=asm-lsp
pkgver=0.10.1
pkgrel=1
pkgdesc="A language server for NASM/GAS/GO Assembly"
arch=('x86_64' 'riscv64')
url="https://crates.io/crates/asm-lsp"
license=('BSD-2-Clause')
makedepends=('cargo')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bergercookie/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('06951419f6ac1014d581a9263947a9f1fb6d3039aaaf3561c45b1910eeedc519163f1f2afb8e1f511f297aaf971b6c75da97c8d76bde56cebd9859b638f6ff84')
b2sums=('3bbcef4bf64388214d6f921b019a62a4574c8ff6e8585ba75b23932d1ff559c85e503f930765888a3be42e241733e525c0feee9cba060abb69edd470d2712a8e')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
