# Maintainer: timvisee <3a4fb3964f@sinenomine.email>
# Maintainer: orhun <orhunparmaksiz@gmail.com>
#
# Based on template. Changes made here will be overwritten each release.
# See: https://gitlab.com/timvisee/prs/-/tree/master/pkg/aur/prs

pkgname=prs
pkgver=0.2.13
pkgrel=1
pkgdesc="Secure, fast & convenient password manager CLI using GPG and git to sync"
arch=('any')
url="https://gitlab.com/timvisee/prs"
license=('GPL3')
depends=('gpgme' 'dbus' 'libxcb' 'libxkbcommon' 'skim' 'tomb')
makedepends=('rust' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('41a317409db4a2a8bc0a6125a5c6de7a7c5a6290856979bca21a143d9b8fbddc80a3497a5aaabab537ccb265b3001c53ad65a9c8e930ac55c30b29bc81151aa7')
_prs_cli_features=alias,clipboard,notify,backend-gpgme,select-skim-bin,tomb

build() {
  cd "$pkgname-v$pkgver"
  cargo build --package prs-cli --no-default-features --features $_prs_cli_features --release --locked
}

check() {
  cd "$pkgname-v$pkgver"
  cargo test --package prs-cli --no-default-features --features $_prs_cli_features --release --locked
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
