# Maintainer: Martin Mariano <arch@martinmariano.com>
pkgname=grex
pkgver=1.1.0
pkgrel=1
pkgdesc="A command-line tool for generating regular expressions from user-provided input strings"
arch=('x86_64')
url="https://github.com/pemistahl/grex"
license=('Apache')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pemistahl/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('99337afc96ab2a55fca4dd38c469cea2ee271371a70dd2b92aa51893524d5800d8b289bd05ffc00c49b7dc457947964c76770230cd43f1fa5b76ce7a412a7b88')

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

