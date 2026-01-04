# Maintainer: Josh Andrews <coding@joshandrews.xyz>
pkgname=hyprsession
pkgver=0.2.1
pkgrel=1
pkgdesc="Saves hyprland sessions"
arch=('x86_64')
url="https://github.com/joshurtree/hyprsession"
license=('GPL-3.0-or-later')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/joshurtree/hyprsession/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('47f229517144ca5b0b59bebb28ca43538231154067766d5c2c6d78c762f2eacb')

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
