# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-modules
pkgver=0.6.0
pkgrel=1
pkgdesc="A cargo plugin for showing an overview of a crate's modules."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/regexident/cargo-modules"
license=("MPL2")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('708e7b1021dd41e77799c28b2e6e4f6b7b636f0a4e4226ebfac5a5a90a1064ee737733600a75ebf58fa51e997019f8d73720b0200056e394d6e950d9f3d5c73c')

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
