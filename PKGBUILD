# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=bonnie
pkgver=0.3.2
pkgrel=1
pkgdesc="Simple, cross-platform, and fast command aliases with superpowers"
arch=('x86_64')
url="https://github.com/arctic-hen7/bonnie"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7b6be42d2149664efe59ea725add6f3f6d55772c6e4378b65417384f2ce5646e')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu" --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
