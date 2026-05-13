# Maintainer: Haseeb Khalid <haseebkhalid1507@gmail.com>
pkgname=synaps
pkgver=0.1.8
pkgrel=1
pkgdesc="Terminal-native AI agent runtime built in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/HaseebKhalid1507/SynapsCLI"
license=('Apache-2.0')
depends=('gcc-libs' 'oniguruma' 'openssl')
makedepends=('cargo' 'oniguruma')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ab8754576791cd3e5a8f88371c38850435401bbb059c38b62a4546e6a61c01d7')

prepare() {
  cd "SynapsCLI-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "SynapsCLI-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release
}

package() {
  cd "SynapsCLI-$pkgver"
  install -Dm755 "target/release/synaps" "$pkgdir/usr/bin/synaps"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
