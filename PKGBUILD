# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=tidy-viewer
_pkgname=tv
pkgver=1.4.9
pkgrel=1
pkgdesc="CLI csv pretty printer that uses column styling"
arch=('x86_64' 'aarch64')
url="https://github.com/alexhallam/tv"
license=('Unlicense')
makedepends=('cargo')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('2e9a8ad5a9a0b3fced659483e3807a4222b1bb6656d975a62c8ff4c5d81f55fc')

prepare() {
  cd "$_pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/UNLICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
