pkgname=ldash
pkgver=1.3.1
pkgrel=1
pkgdesc="Terminal dashboard TUI for hledger — crypto portfolio, net worth, monthly income/expenses"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/md-weber/ldash"
license=('GPL-3.0-or-later')
makedepends=('rust' 'cargo')
conflicts=('ldash-bin')
provides=('ldash')

source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/md-weber/ldash/archive/v$pkgver.tar.gz")
sha256sums=('672c84392930c3bf5ef77a9f6b072858f861e2ad71b990553270fe9610e71861')

build() {
  cd "$srcdir/ldash"
  cargo build --release --locked
}

package() {
  cd "$srcdir/ldash"
  install -Dm755 target/release/ldash "$pkgdir/usr/bin/ldash"
  install -Dm644 man/ldash.1 "$pkgdir/usr/share/man/man1/ldash.1"
}
