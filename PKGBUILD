# Maintainer: patryk-s <patryk.sidzina@gmail.com>
pkgname=package-assistant
pkgver=1.0.1
pkgrel=1
pkgdesc="Provides a consistent CLI interface for all supported package managers, across multiple OSes, so you don't have to remember the specific syntax on a given system."
arch=('x86_64' 'aarch64')
url="https://github.com/patryk-s/package-assistant"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/patryk-s/package-assistant/archive/$pkgver.tar.gz")
sha256sums=('fd6bdc24c1afbca874aca1c23f639da930793bbafac0722c7ad252f0fc1689d8')

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/pa" "$pkgdir/usr/bin/pa"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
