# Maintainer: Carlo Abelli <carlo@abelli.me>

pkgname=biff
pkgver=0.1.1
pkgrel=1
pkgdesc="A command line tool for datetime arithmetic, parsing, formatting and more"
arch=(x86_64)
url=https://github.com/BurntSushi/biff
license=(MIT Unlicense)
depends=()
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/BurntSushi/biff/archive/refs/tags/$pkgver.tar.gz")
sha256sums=(459a9d4e085b1545e8974ed16a49f161f6efad2a7b14a4292fa28b49e6ef9292)

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
  install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
