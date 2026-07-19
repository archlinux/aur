# Maintainer: ewgsta <ewgst@proton.me>
pkgname=anisub-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Türkçe anime alt yazı platformu anisub.co için cli aracı."
arch=('x86_64')
url="https://github.com/ewgsta/anisub-cli"
license=('GPL-3.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('f3e16abeb1e5c9ca360b5bb9a6c98c087782e78cc59a80455c3ebc8734100b4e')

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
