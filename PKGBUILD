# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=prs
pkgver=0.1.6
pkgrel=1
pkgdesc="Secure, fast & convenient password manager CLI using GPG and git to sync"
arch=('x86_64')
url="https://gitlab.com/timvisee/prs"
license=('GPL3')
depends=('gpgme' 'dbus' 'gtk3')
makedepends=('rust' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('d98c703a25048d44a5e440f061d4e0a93d050aa1c3a877bad7ca93aa1b29cc9d5207567309be91a7f21a6cfdc0bd99271ce8e6ffa40b8ac1af608f6dc1653017')

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
