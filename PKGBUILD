# Maintainer: Bolt J Woofson <bolt@boop.no>
pkgname=notedog
pkgver=0.5.0
pkgrel=1
pkgdesc="A vibrant, cross-platform TUI Notes application in Rust inspired by OneNote and Obsidian"
arch=('x86_64' 'aarch64')
url="https://github.com/Woofson/notedog"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a6da52bc1792b8b4cf73e446d57c8cd90206922276c25a37551c00aecc2d5409')

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/notedog" "$pkgdir/usr/bin/notedog"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "notedog.toml.example" "$pkgdir/usr/share/doc/$pkgname/notedog.toml.example"
}
