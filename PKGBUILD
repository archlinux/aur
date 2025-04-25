pkgname=tempesta
pkgver=0.0.79
pkgrel=1
pkgdesc="The fastest and lightest bookmark manager CLI written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/tempesta"
license=('MIT')
depends=('glibc')
makedepends=('rust')

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/x71c9/$pkgname/tar.gz/refs/tags/v$pkgver")
sha256sums=("90d7486f704cc258ad62b7662132b629576c35e0d5b907b8fe9af0f31357e701")

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
} 
package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
