pkgname=tin-summer
pkgver=1.21.8
pkgrel=1
pkgdesc="Find build artifacts that are taking up disk space"
arch=('x86_64')
url="https://github.com/vmchale/tin-summer"
license=('custom:BSD')
depends=()
makedepends=('rust' 'cargo')
provides=('tin-summer')
conflicts=('mono')
source=("git+https://github.com/vmchale/tin-summer.git#tag=$pkgver")
sha512sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  which rustup > /dev/null 2>&1 && CARGO="rustup run nightly cargo" || CARGO=cargo

  $CARGO build --release
}

check() {
  cd "$srcdir/$pkgname"
  which rustup > /dev/null 2>&1 && CARGO="rustup run nightly cargo" || CARGO=cargo

  $CARGO check --release
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m664 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 "target/release/sn" "$pkgdir/usr/bin/sn"
}

# vim:set ts=2 sw=2 et:
