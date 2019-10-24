# Maintainer: ftilde <ftilde at protonmail dot com>
pkgname=ugdb
pkgver=0.1.5
pkgrel=1
pkgdesc="An alternative TUI for gdb"
arch=('x86_64')
url="https://github.com/ftilde/ugdb"
license=('MIT')
depends=('gdb')
makedepends=('cargo' 'git' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ftilde/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('72c62ea95aff8a7d880a024ce69b18446d425e542a394fad66cb5ec055f963b438a18b1fd4ac4dbeac6918b46105e00b4c115897926451dd2ececc03e6d59606')
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
