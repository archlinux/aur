# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=lqth
pkgver=0.2.2
pkgrel=1
epoch=
pkgdesc="Simple but blazingly fast screenshot utility"
arch=(x86_64)
url="https://github.com/0x61nas/lqth"
license=('MIT')
makedepends=(cargo libx11)
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('8452edf08ef94793097fdb6e1f5f498e3844aefc424f3b743f504e12aa697a1b')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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

