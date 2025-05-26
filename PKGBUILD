# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-typify
pkgver=0.4.1
pkgrel=3
pkgdesc="JSON schema to rust type code generator"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/oxidecomputer/typify"
license=("Apache-2.0")
depends=("gcc-libs" "rustfmt")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('ae6408af50249119522b54e53f370d245c16f7617723ce458ce7ea5e03292b46b99ac2c008c22e0c1f168d00976691e15398dd419e452911b298b38643134e86')

prepare() {
  cd ${pkgname}-${pkgver}
  #cargo fetch --locked
  # temporary: lock file needs to be updated
  cargo fetch
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --frozen --all-features
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 -t "${pkgdir}/usr/bin/" target/release/cargo-typify
}
