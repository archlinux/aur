# Maintainer: AltoXorg

pkgname=pigment64
pkgver=0.4.2
pkgrel=1
pkgdesc="A library for handling conversion between N64 texture formats and modern image formats"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/decompals/pigment64"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/decompals/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('bbed837f78760f0e47cd90815bf6edcadeee7a8a8cb3b53804bc2dab118a1da9514014289790d80377518407caf0ed1b3d824e4cff1bc862431c078f275ed099')

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
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}
