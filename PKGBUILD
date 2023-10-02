# Maintainer: Christian Visintin <christian dot visintin at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=termscp
pkgver=0.12.2
pkgrel=1
pkgdesc="A feature rich terminal UI file transfer and explorer"
url="https://github.com/veeso/termscp"
license=("MIT")
arch=("any")
depends=('gcc-libs' 'glibc' 'zlib' 'openssl' 'dbus')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c1cdf37185f78bd160ff92d19a294c04d741233ea992226f9c9192c1b3d18b84')

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
