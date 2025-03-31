# Maintainer: Kino <cybao292261@163.com>
# Contributor: Mattia Ronchi <ronchimattia03 at gmail dot com>

pkgname=asm-lsp
pkgver=0.10.0
pkgrel=1
pkgdesc="A language server for NASM/GAS/GO Assembly"
arch=('x86_64' 'riscv64')
url="https://crates.io/crates/asm-lsp"
license=('BSD-2-Clause')
makedepends=('cargo')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bergercookie/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('97642c90f665c7cd86c72e0124655799c1773b8cc91915c071af97dd1dfd41881c0a3db187a0278aac887466499ad4dba22a6d7b2d0ad2636a83a88143cd6ef4')
b2sums=('7e05af30f4eeb8985bdea74edac8495bb41ff24a88ec05f88bdaed1824d286d90bb8ccc76d792d4fb52b285010586e6715a723deaed7a1fd7feb2985e7a5ef67')

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
