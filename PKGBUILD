# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: timvisee <3a4fb3964f@sinenomine.email>
# https://github.com/orhun/pkgbuilds

pkgname=prs
pkgver=0.2.3
pkgrel=1
pkgdesc="Secure, fast & convenient password manager CLI using GPG and git to sync"
arch=('x86_64')
url="https://gitlab.com/timvisee/prs"
license=('GPL3')
depends=('gpgme' 'dbus' 'gtk3')
makedepends=('rust' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('a9e656cc291c37d6d5e6c1ad8f3aae1d89a99cd10e9f537838c2e8ec1d979be215e972ecfe228d4d524eb11e6457f89c1ebe75ab7cec3e8d7fea38a95a55a8ca')

build() {
  cd "$pkgname-v$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-v$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
