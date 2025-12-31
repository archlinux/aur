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
sha256sums=('9a6e679c8eab2bd3ac48796e10ea5f648ea64d9b4e99f20a07b923984fcae576')

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
