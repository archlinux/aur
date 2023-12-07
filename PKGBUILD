# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=cargo-mommy
pkgver=0.3.1
pkgrel=1
pkgdesc="Mommy's here to support you when running cargo~"
url='https://github.com/Gankra/cargo-mommy'
license=('Apache' 'MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('git' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('9ed71fe85dd1edc1f19217c87a58bbc035dc4c69b037cfec52d8ed8406561f78')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd $pkgname-$pkgver

  cargo fetch --locked --target $_target
}

build() {
  cd $pkgname-$pkgver

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release
}

package() {
  cd $pkgname-$pkgver

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/cargo-mommy
}

