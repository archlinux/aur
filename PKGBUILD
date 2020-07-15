# Maintainer: ftilde <ftilde at protonmail dot com>
pkgname=ugdb
pkgver=0.1.8
pkgrel=1
pkgdesc="An alternative TUI for gdb"
arch=('x86_64')
url="https://github.com/ftilde/ugdb"
license=('MIT')
depends=('gdb')
makedepends=('cargo' 'git' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ftilde/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('c1df16f849b753dd853420b37725e7521d0d31d1fc225087c0870a4d315b499b1b13742321a5887f225005f850c0934418844e75670d34e37b0808b5d618a588')
options=('!strip') #Required to print helpful backtraces in case of crashes

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/ugdb" "$pkgdir/usr/bin/ugdb"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
