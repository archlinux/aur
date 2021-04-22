# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: timvisee <3a4fb3964f@sinenomine.email>
# https://github.com/orhun/pkgbuilds

pkgname=prs
pkgver=0.2.8
pkgrel=1
pkgdesc="Secure, fast & convenient password manager CLI using GPG and git to sync"
arch=('any')
url="https://gitlab.com/timvisee/prs"
license=('GPL3')
depends=('gpgme' 'dbus' 'libxcb')
makedepends=('rust' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('d19a4eaac478dd8497c177f2e9d40bb7d799ec018f6f87a7e9b7177b4751a9e4fac2995df794c9be9dec0d734c03d36d2b9533705936cb66838dd5565b0b91e0')

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
