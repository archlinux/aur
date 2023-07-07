# Maintainer: Christian Visintin <christian dot visintin at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=termscp
pkgver=0.12.1
pkgrel=1
pkgdesc="A feature rich terminal UI file transfer and explorer"
url="https://github.com/veeso/termscp"
license=("MIT")
arch=("any")
depends=('gcc-libs' 'glibc' 'zlib' 'openssl' 'dbus')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6c0ae86db982cc537564bd8a4b9746365f96d3a7f6f5b002da61fcc382e852e6')

prepare() {
   cd "$pkgname-$pkgver"
   cargo fetch --locked
}

build() {
   cd "$pkgname-$pkgver"
   cargo build --release --locked --target-dir=target
}

check() {
   cd "$pkgname-$pkgver"
}

package() {
   cd "$pkgname-$pkgver"
   cargo install \
      --locked \
      --no-track \
      --path . \
      --root "${pkgdir}"/usr
   install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
   install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
