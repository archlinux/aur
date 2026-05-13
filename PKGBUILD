# Maintainer: Haseeb Khalid <haseebkhalid1507@gmail.com>
pkgname=synaps
pkgver=0.1.9
pkgrel=1
pkgdesc="Terminal-native AI agent runtime built in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/HaseebKhalid1507/SynapsCLI"
license=('Apache-2.0')
depends=('gcc-libs' 'oniguruma' 'openssl')
makedepends=('cargo' 'oniguruma')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ec8d31d89f98117dea8ae77a25103d1e2ec1fab885a5e8bf8f6b033deb99189a')

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
