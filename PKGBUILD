# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=wac
pkgver=0.11.0
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

sha256sums=('8999e6c40d88eb5786424fa150df1c0e5f26ab29223b88bcc6fbd36a4a2f3c97')
