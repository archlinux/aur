# Maintainer: Haseeb Khalid <haseebkhalid1507@gmail.com>
pkgname=synaps
pkgver=0.1.4
pkgrel=1
pkgdesc="Terminal-native AI agent runtime built in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/HaseebKhalid1507/SynapsCLI"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('29729f0d60226fade58b3f01cd6ae476fb255b780f5b57ace80a4be0966734af')

prepare() {
  cd "SynapsCLI-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "SynapsCLI-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "SynapsCLI-$pkgver"
  install -Dm755 "target/release/synaps" "$pkgdir/usr/bin/synaps"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
