# Maintainer: ftilde <ftilde at protonmail dot com>
pkgname=ugdb
pkgver=0.1.7
pkgrel=1
pkgdesc="An alternative TUI for gdb"
arch=('x86_64')
url="https://github.com/ftilde/ugdb"
license=('MIT')
depends=('gdb')
makedepends=('cargo' 'git' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ftilde/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('1002714e3aadfad685fdd9517a6f6afd891aaddd5d862841e1bbac511c58aeaa66cdba02f2ddf7806ea179b7f0e98711661d6b1eed0b85cbe78900c04ddcaa5c')
options=('!strip') #Required to print helpful backtraces in case of crashes

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/ugdb" "$pkgdir/usr/bin/ugdb"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
