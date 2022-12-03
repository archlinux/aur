# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-modules
pkgver=0.7.0
pkgrel=1
pkgdesc="A cargo plugin for showing an overview of a crate's modules."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/regexident/cargo-modules"
license=("MPL2")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('4a58414c4b51f5d7801d53578d04ee6f252fad2bfeb07e99a3a41268736514b02b449c2ea20d6b33707c8457314b3fccd864223eba29f2f21b730e0572e1aad1')

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
  install -Dm 755 -t "${pkgdir}/usr/bin" target/release/cargo-modules
}
