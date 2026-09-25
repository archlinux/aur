# Maintainer: fraa2a <fraa2a at users dot noreply dot github dot com>
pkgname=word2a
pkgver=0.1.0
pkgrel=1
pkgdesc='Terminal word game in Italian'
arch=('x86_64')
url='https://github.com/fraa2a/word2a'
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/fraa2a/word2a/tar.gz/refs/tags/v$pkgver")
sha256sums=('cbd4e49b995699d92f123397992c70cad66c3161e35c3b4a83b6a954f557699e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 target/release/word2a "$pkgdir/usr/bin/word2a"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
