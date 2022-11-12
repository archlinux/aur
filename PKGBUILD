# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=aarty
pkgver=0.3.9
pkgrel=1
epoch=
pkgdesc="A simple CLI tool to convert the images to ASCII art 🦀💙"
arch=(x86_64)
url="https://github.com/anas-elgarhy/aarty"
license=('MIT')
makedepends=(cargo)
provides=(aarty)
conflicts=()
replaces=(aarty)
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
noextract=()

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

check() {
  cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  sudo install -Dm0755 -t "/usr/bin/" "target/release/$pkgname"
}
sha256sums=('e8d38c5060ce233a231f9082cce58a5a57c4e8de380a4611525882e0f28c420f')
