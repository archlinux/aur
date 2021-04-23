# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=provok
pkgver=0.1.0
pkgrel=1
pkgdesc="A text renderer written in Rust"
arch=('x86_64')
url="https://github.com/o2sh/provok"
license=('MIT')
depends=('freetype2' 'harfbuzz')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f0847ae33691212e05961970498fe03bea09b8f6cbd12148842aae06cc50fbeb')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 target/release/provok -t "$pkgdir/usr/bin/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
