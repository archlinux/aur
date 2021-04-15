# Maintainer: Martin Mariano <arch@martinmariano.com>
pkgname=grex
pkgver=1.2.0
pkgrel=1
pkgdesc="A command-line tool for generating regular expressions from user-provided input strings"
arch=('x86_64')
url="https://github.com/pemistahl/grex"
license=('Apache')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pemistahl/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('e9e9c9f951d189bce13f7b695a5e5a340912759e0f6910efcaf3b7e8cc75624e8d05ee504f25e4fd0cea5905f0f646c78364da6ce5c1a8f869460823d572d8e5')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/grex" "$pkgdir/usr/bin/grex"

  install -Dm644 "RELEASE_NOTES.md" "$pkgdir/usr/share/doc/${pkgname}/RELEASE_NOTES.md"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

