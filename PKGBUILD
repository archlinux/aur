# Maintainer: croaky-fx <217624563+croaky-fx@users.noreply.github.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=oxiclean
pkgver=1.3.0
pkgrel=2
pkgdesc="Fast Cross-Distribution Linux System Cleaner written in Rust"
arch=('x86_64')
url="https://github.com/croaky-fx/oxiclean"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('b469f92c517294e9520bd57329977981b2ca73032e40002714bd96d286d7f7a9')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname"
  cargo build --release --frozen --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
