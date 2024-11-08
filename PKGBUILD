# Maintainer: Yo'av Moshe <archlinux@yoavmoshe.com>
pkgname=wttrbar
pkgver=0.11.0
pkgrel=1
pkgdesc="Weather indicator for Waybar"
url="https://github.com/bjesus/wttrbar"
arch=("any")
license=("MIT")
options=(!lto)
makedepends=('rust')
source=("source-$pkgver.tar.gz::https://github.com/bjesus/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=("049cbfe29703bf1f976b8887d35d9deccfea9e67d221b2337f81b962ee254edd78d98e9567584f59ce3c58fcc2e09b80628b51f96d45e10c6ae4b8ac48e26124")

prepare() {
  mv $pkgname-$pkgver/* .
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
