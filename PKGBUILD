# Maintainer: Bolt J Woofson <bolt@boop.no>
pkgname=notedog
pkgver=0.5.3
pkgrel=1
pkgdesc="A vibrant, cross-platform TUI Notes application in Rust inspired by OneNote and Obsidian"
arch=('x86_64' 'aarch64')
url="https://github.com/Woofson/notedog"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a53068288af87c11b0a5acb1b3f4ef861c9558dcb03ae5509974bfc552ff22fe')

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
  install -Dm644 "theme.toml.example" "$pkgdir/usr/share/doc/$pkgname/theme.toml.example"
  for theme in themes/*.toml; do
    install -Dm644 "$theme" "$pkgdir/usr/share/doc/$pkgname/$theme"
  done
}
