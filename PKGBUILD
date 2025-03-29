# Maintainer: Your Name <ahacadev@gmail.com>
pkgname=gh-heat
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal GitHub contribution heatmap generator written in Rust"
arch=('x86_64')
url="https://github.com/ahacad/gh-heat"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ahacad/gh-heat/archive/v$pkgver.tar.gz")
sha256sums=('c69cd94e9c3b6a1eb2fbe7fcab0cee4f2da9728bb95d6950b291822a98f6bce2') # Replace with actual SHA256 after uploading to GitHub

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
