# Maintainer: Josh Andrews <coding@joshandrews.xyz>
pkgname=hyprsession
pkgver=0.2.0
pkgrel=6
pkgdesc="Saves hyprland sessions"
arch=('x86_64')
url="https://github.com/joshurtree/hyprsession"
license=('GPL-3.0-or-later')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/joshurtree/hyprsession/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('df342d10a4d4e8e3c89f8a1ff5de9ccdf3cca260cd90cad391b14be19aecb1a4')

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
