# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: timvisee <3a4fb3964f@sinenomine.email>
# https://github.com/orhun/pkgbuilds

pkgname=prs
pkgver=0.2.5
pkgrel=1
pkgdesc="Secure, fast & convenient password manager CLI using GPG and git to sync"
arch=('x86_64')
url="https://gitlab.com/timvisee/prs"
license=('GPL3')
depends=('gpgme' 'dbus' 'gtk3')
makedepends=('rust' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('0db5a2a0e9305f22c3c617d4857a08c7015d922f84c863e74cd81d4ba043caf6b0f5a7ad3e349b65f4113b6cc6f8548c940bf798a525144550042423d7bbd849')

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
