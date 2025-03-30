# Maintainer: Christian Visintin <christian dot visintin at veeso dot dev>

pkgname=tuifeed
pkgver=0.4.2
pkgrel=1
pkgdesc="A terminal feed reader with a fancy ui"
url="https://github.com/veeso/tuifeed"
license=("MIT")
arch=("any")
depends=()
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fd605062d35ac07d2bedc0e5ef19f1edf89529606513d42e88a49a5e93c51fc8')

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
