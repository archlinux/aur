# Maintainer: xendr4x <w_xendr4x@proton.me>
pkgname=metadump
pkgver=1.0.0
pkgrel=1
pkgdesc="Metadata analysis tool - extracts, categorises, and risk-ranks metadata from files"
arch=('x86_64')
url="https://github.com/mansar1337/metadump"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f2354acc7af2668612dbf2e93926e8b6d54b240639c215c6cec703c6473813a6')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
