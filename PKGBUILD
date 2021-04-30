# Maintainer: timvisee <3a4fb3964f@sinenomine.email>
# Maintainer: orhun <orhunparmaksiz@gmail.com>
#
# Based on template. Changes made here will be overwritten each release.
# See: https://gitlab.com/timvisee/prs

pkgname=prs
pkgver=0.2.11
pkgrel=1
pkgdesc="Secure, fast & convenient password manager CLI using GPG and git to sync"
arch=('any')
url="https://gitlab.com/timvisee/prs"
license=('GPL3')
depends=('gpgme' 'dbus' 'libxcb')
makedepends=('rust' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('ca678d9138dfcd0c9826c2cac51ee3e27133b986e14278d67ffbebc91ecb4338cd5a200b13c126a4fde3e9125222cea223bb83169b44f42a2fe51fe58187d03e')

build() {
  cd "$pkgname-v$pkgver"
  cargo build --package prs-cli --release --locked
}

check() {
  cd "$pkgname-v$pkgver"
  cargo test --package prs-cli --release --locked
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
