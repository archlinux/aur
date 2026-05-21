# Maintainer: R <rqou@berkeley.edu>

pkgname=spamassassin-milter
pkgver=0.5.0
pkgrel=2
pkgdesc="Milter for spam filtering with SpamAssassin (Rust)"
arch=('x86_64')
url="https://codeberg.org/glts/spamassassin-milter"
license=('GPL-3.0-or-later')
depends=(
  'glibc'
)
makedepends=('rust')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('645e2d4479a19bb6b8b4927b10d35e3064eff5f5d74e07b6ebf751a74be6bf44e9b86ab0a2612de7b1893776cab947b0a858ac86674269d3baf5fc4f688c5dcf')

build() {
  cd "$pkgname"

  SPAMASSASSIN_MILTER_SPAMC=/usr/bin/vendor_perl/spamc cargo build --release --locked
}

check() {
  cd "$pkgname"

  # Don't run tests for now, since we can't guarantee a running copy of SA
  #cargo test --release --locked
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" target/release/spamassassin-milter

  install -vDm644 -t "$pkgdir/usr/share/man/man8" spamassassin-milter.8

  install -vDm644 -t "$pkgdir/usr/lib/systemd/system" spamassassin-milter.service
}
