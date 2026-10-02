# Maintainer: Viktoras Agejevas <v.agejevas at gmail dot com>
pkgname=swayview
pkgver=0.1.8
pkgrel=1
pkgdesc='Live workspace overview for sway'
arch=('x86_64')
url='https://github.com/agejevasv/swayview'
license=('MIT')
depends=('glibc' 'libgcc' 'libxkbcommon' 'sway')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f5b230f79c3129a98bbf446d081b4708da8e4ff80579d4b0138681bdc641bf48')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
