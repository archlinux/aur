pkgname=ldash
pkgver=1.2.0
pkgrel=1
pkgdesc="Terminal dashboard TUI for hledger — crypto portfolio, net worth, monthly income/expenses"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/md-weber/ldash"
license=('GPL-3.0-or-later')
makedepends=('rust' 'cargo')
conflicts=('ldash-bin')
provides=('ldash')

source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/md-weber/ldash/archive/v$pkgver.tar.gz")
sha256sums=('76f98eb42b2728432485bb9b2a78e23a3f60e2660292d913a1cc534e3f0e97e0')

build() {
  cd "$srcdir/ldash"
  cargo build --release --locked
}

package() {
  cd "$srcdir/ldash"
  install -Dm755 target/release/ldash "$pkgdir/usr/bin/ldash"
  install -Dm644 man/ldash.1 "$pkgdir/usr/share/man/man1/ldash.1"
}
