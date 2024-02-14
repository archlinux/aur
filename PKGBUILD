# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Daniel Maslowski <info@orangecms.org>

pkgname=biodiff
pkgver=1.1.0
pkgrel=2
pkgdesc='Hex diff viewer using alignment algorithms from biology'
arch=(x86_64)
url=https://github.com/8051Enthusiast/biodiff
license=(MIT)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('fd04f79c2e5a584378731179075fb82a0a9c08a9a9b940a971899c6f3bb68108f564836f7191ca25c41fee6fd47bd2d8701f35f824ebc60a118ea71ea498b1ef')

prepare() {
  RUSTUP_TOOLCHAIN=stable cargo fetch --locked --manifest-path=$pkgname-$pkgver/Cargo.toml --target="$CARCH-unknown-linux-gnu"
}

build() {
  RUSTUP_TOOLCHAIN=stable cargo build --release --manifest-path=$pkgname-$pkgver/Cargo.toml --target-dir=$pkgname-$pkgver/target --all-features
}

check() {
  RUSTUP_TOOLCHAIN=stable cargo test --release --manifest-path=$pkgname-$pkgver/Cargo.toml --target-dir=$pkgname-$pkgver/target
}

package() {
  install -Dm755 $pkgname-$pkgver/target/release/$pkgname -t "$pkgdir/usr/bin"
}
