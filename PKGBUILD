# Maintainer: Christian Visintin <christian dot visintin at gmail dot com>

pkgname=tuifeed
pkgver=0.2.1
pkgrel=1
pkgdesc="A terminal feed reader with a fancy ui"
url="https://github.com/veeso/tuifeed"
license=("MIT")
arch=("any")
depends=()
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('95c649ce2e2aba8574a87a5e9b0f099bdff570c426b43ddf4dd4f6cc9d04cf7f')

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
