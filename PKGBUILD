# Maintainer: Ryan Putrama Yahya <punkofthedeath at gmail.com>
pkgname=kdl-lsp
pkgver=6.7.1
pkgrel=1
pkgdesc="A KDL Language Server Protocol implementation from kdl-rs"
arch=('any')
url="https://github.com/kdl-org/kdl-rs"
license=('Apache-2.0')
depends=('glibc')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/kdl-lsp-v$pkgver.tar.gz")
sha256sums=('b695f9a5cbec847e62b876c4efbf14ad9313359435c75a35696fdab165ec89f9')

build() {
  cd "$srcdir/kdl-rs-$pkgname-v$pkgver"
  cargo build --release --locked --package kdl-lsp
}

package() {
  cd "$srcdir/kdl-rs-$pkgname-v$pkgver"
  install -Dm755 target/release/kdl-lsp "$pkgdir/usr/bin/kdl-lsp"
  install -Dm644 tools/kdl-lsp/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
