# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=wac
pkgver=0.10.1
pkgrel=1
pkgdesc="WebAssembly Composition (WAC) tooling"
arch=("x86_64")
url="https://github.com/bytecodealliance/wac"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("https://github.com/bytecodealliance/wac/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=("!lto" "!debug")

prepare() {
  cd $pkgname-$pkgver

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --target "$CARCH-unknown-linux-gnu" --release
}

package() {
  install -Dm0755 $pkgname-$pkgver/target/$CARCH-unknown-linux-gnu/release/wac "$pkgdir"/usr/bin/wac
}

sha256sums=('a85a1eb163f48aa8cd90074d3b73dc4191f2b24d59e557144e3c2b7d6dd8bfb4')
