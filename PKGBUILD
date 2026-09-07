pkgname=ldash
pkgver=1.6.0
pkgrel=1
pkgdesc="Terminal dashboard TUI for hledger — crypto portfolio, net worth, monthly income/expenses"
arch=('x86_64' 'aarch64')
url="https://github.com/md-weber/ldash"
license=('GPL-3.0-or-later')
depends=('hledger')
makedepends=('rust' 'cargo')
conflicts=('ldash-bin')
provides=('ldash')

source=("$pkgname-$pkgver.tar.gz::https://github.com/md-weber/ldash/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ef1d04f4d482565fdefecb0713ceb231b9f241fb05e2d45c668bad109ec79dd4')

build() {
  cd "$srcdir/ldash-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/ldash-$pkgver"
  install -Dm755 target/release/ldash "$pkgdir/usr/bin/ldash"
  install -Dm644 man/ldash.1 "$pkgdir/usr/share/man/man1/ldash.1"
}
