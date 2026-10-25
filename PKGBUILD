# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=mazter
pkgver=2.1.2
pkgrel=1
pkgdesc="Mazes in your terminal"
arch=('x86_64')
url="https://dystroy.org/mazter/"
license=(MIT)
depends=()
makedepends=(cargo)
source=(${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate)
sha512sums=('2f3762261d48867492d239583c46fe599736c61f58ca099f8eb7a684d5ba953fece03b23a72728bf0f78c5566729241b86e1a9f00e4eca40fefa6006eab66791')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd ${pkgname}-${pkgver}
  cargo build --frozen --release --all-features
}

package() {
  cd ${pkgname}-${pkgver}
  install -D "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
