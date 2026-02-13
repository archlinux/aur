# Maintainer: Duncan Mac-Vicar P. <duncan@mac-vicar.eu>

pkgname=mmdr
pkgver=0.2.0
pkgrel=1
pkgdesc='Fast Mermaid diagram renderer written in Rust'
arch=('x86_64')
url='https://github.com/1jehuang/mermaid-rs-renderer'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'rust')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/1jehuang/mermaid-rs-renderer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b512e5e7f259a9efe1ba968a28acbbcf144adc6f0f1423758401636de64e807e')

prepare() {
  cd "mermaid-rs-renderer-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "mermaid-rs-renderer-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "mermaid-rs-renderer-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features
}

package() {
  cd "mermaid-rs-renderer-$pkgver"
  install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
