# Maintainer: Christian Visintin <christian dot visintin at gmail dot com>

pkgname=tuifeed
pkgver=0.3.1
pkgrel=1
pkgdesc="A terminal feed reader with a fancy ui"
url="https://github.com/veeso/tuifeed"
license=("MIT")
arch=("any")
depends=()
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fb0da8c49bf833f946ec4a15fab05875748a29c68916efa5998d21613b53188a')

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
