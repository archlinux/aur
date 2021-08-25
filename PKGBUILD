# Maintainer: timvisee <3a4fb3964f@sinenomine.email>
# Maintainer: orhun <orhunparmaksiz@gmail.com>
#
# Based on template. Changes made here will be overwritten each release.
# See: https://gitlab.com/timvisee/prs/-/tree/master/pkg/aur/prs

pkgname=prs
pkgver=0.3.0
pkgrel=1
pkgdesc="Secure, fast & convenient password manager CLI using GPG and git to sync"
arch=('any')
url="https://gitlab.com/timvisee/prs"
license=('GPL3')
depends=('gpgme' 'dbus' 'libxcb' 'libxkbcommon' 'skim' 'tomb')
makedepends=('rust' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('369da473057df977175ce532a7b9c3b9cb844ba93717796650b8765899ffd1ee4a00ea7ece8e61f9924399ad70377282b20af5339caa762c23b292b7bcfc73f1')
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
