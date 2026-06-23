# Maintainer: Ryan Putrama Yahya <punkofthedeath at gmail.com>
pkgname=kdl-lsp
pkgver=6.6.1
pkgrel=1
pkgdesc="A KDL Language Server Protocol implementation from kdl-rs"
arch=('any')
url="https://github.com/kdl-org/kdl-rs"
license=('Apache-2.0')
depends=('glibc')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3bb60d8304e1f910a8d9c436125e4512cef9c95f535dd8882be9932d7d12c253')

build() {
  cd "$srcdir/kdl-rs-$pkgver"
  cargo build --release --locked --package kdl-lsp
}

package() {
  cd "$srcdir/kdl-rs-$pkgver"
  install -Dm755 target/release/kdl-lsp "$pkgdir/usr/bin/kdl-lsp"
  install -Dm644 tools/kdl-lsp/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
