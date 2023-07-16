# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=aarty
pkgver=0.4.9
pkgrel=1
epoch=
pkgdesc="A simple CLI tool to convert the images to ASCII art 🦀💙"
arch=(x86_64)
url="https://github.com/0x61nas/aarty"
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

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
sha256sums=('d9b059f8d87e1f3bd86855d6489e08c9730ea0c105c644376856fbfc654820aa')
