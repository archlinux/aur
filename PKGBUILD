# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=ports-sniffer
pkgver=0.0.3
pkgrel=0
epoch=
pkgdesc="A simple port sniffer(scanner) implementation with 🦀"
arch=(x86_64)
url="https://github.com/anas-elgarhy/ports-sniffer"
license=('MIT')
groups=()
depends=()
makedepends=(cargo)
checkdepends=()
optdepends=()
provides=(ports-sniffer)
conflicts=()
replaces=(ports-sniffer)
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
sha256sums=('d1949836bc156ebf1e5d0bc5c272663b38608399472f5a88212b37f9af66ec4f')
