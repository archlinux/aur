# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=cork-rs
_name=cork
pkgver=0.1.2
pkgrel=1
pkgdesc="A command-line calculator for hex-lovers"
arch=('x86_64')
url="https://github.com/reddocmd/cork"
license=('GPL')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bb70f7ca21cd3de2947c0b658f13d869e62e9e6b4682f131705da1bebdb0f3a4')

build() {
  cd "$_name-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$_name-$pkgver"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "$_name-$pkgver"
  install -Dvm 755 target/release/cork -t "$pkgdir/usr/bin/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

