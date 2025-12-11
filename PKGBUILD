# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=lqth
pkgver=0.2.4
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
sha256sums=('2a616f8a882f2247b4b2b79cb6473fe149e594706670df7b29a204f00ed0b7df')

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

