# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-typify
pkgver=0.4.3
pkgrel=1
pkgdesc="JSON schema to rust type code generator"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/oxidecomputer/typify"
license=("Apache-2.0")
depends=("gcc-libs" "rustfmt")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('b044ef5c55d6cd7d2fb065c3f306a5e0730290b7b2d3f06e04076877d11282f7cbd67c97afd6c908209822b7c4763aabe2614d3f0e80876353ac1c6b8ef72fe0')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --frozen --all-features
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 -t "${pkgdir}/usr/bin/" target/release/cargo-typify
}
