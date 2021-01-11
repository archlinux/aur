# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=prs
pkgver=0.1.5
pkgrel=1
pkgdesc="Secure, fast & convenient password manager CLI using GPG and git to sync"
arch=('x86_64')
url="https://gitlab.com/timvisee/prs"
license=('GPL3')
depends=('gpgme' 'dbus' 'gtk3')
makedepends=('rust' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('e34e701c5733a1f838ac9b7eb42796247ccf0d6d2e9ff76acf60d1de8cd0a499a7c2347555be252a9c0caa19365c1f0a91c0b84cc7c406507c7d70bc19a6aee2')

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
