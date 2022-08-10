# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=cmus-rpc-rs
pkgver=0.1.3
pkgrel=1
epoch=
pkgdesc="A Discord Rich Presence for cmus player using rust 🦀💙"
arch=(x86_64)
url="https://github.com/anas-elgarhy/cmus-rpc-rs"
license=('MIT')
groups=()
depends=(cmus)
makedepends=(cargo)
checkdepends=()
optdepends=()
provides=(cmus-rpc-rs)
conflicts=()
replaces=(cmus-rpc-rs)
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
noextract=()

prepare() {
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  sudo install -Dm0755 -t "/usr/bin/" "target/release/$pkgname"
}
sha256sums=('bb614079c3f144b71d5f2a5f22bb672edf5fe431fdfd20aa18b91e9624b71502')
