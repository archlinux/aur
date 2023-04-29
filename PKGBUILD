# Maintainer: Petr Kracik <petrkr@petrkr.net>
pkgname=nostcat
pkgver=0.3.3
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Websocket client for nostr relay scripting"
source=("https://github.com/blakejakopovic/nostcat/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=("991ae43adb8c2acb129b528e8a502329ab4780ed57c3553cf7ec3ac2b1e2cf7d")

# Generated in accordance to https://wiki.archlinux.org/title/Rust_package_guidelines.
prepare() {
  cd nostcat-$pkgver 
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd nostcat-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd nostcat-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "nostcat-$pkgver/target/release/$pkgname"
}
