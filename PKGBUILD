# Maintainer: Antoine Büsch <antoine dot busch at gmail dot com>

pkgname=sinuous
pkgver=0.1.3
pkgrel=1
pkgdesc="A simple TUI to control local Sonos speakers"
url="https://github.com/abusch/sinuous"
license=("MIT")
arch=("any")
depends=()
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('796131dfe6495c78f02077eda897795f1f8ec9a54c12fd1e90a3874759de3003')

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
