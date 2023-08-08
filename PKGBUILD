# Maintainer: AltoXorg

pkgname=pigment64
pkgver=0.3.0
pkgrel=1
pkgdesc="A library for handling conversion between N64 texture formats and modern image formats"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/decompals/pigment64"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/decompals/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('164b37ea96bfd980c92f2e53b2210c9c3dd20a067faf5c7e979732b63945ccada074ca857467e0d1905899e719ca1315664e6d6930c7a048c146312341e18326')

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
