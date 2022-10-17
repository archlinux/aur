# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-modules
pkgver=0.5.12
pkgrel=1
pkgdesc="A cargo plugin for showing an overview of a crate's modules."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/regexident/cargo-modules"
license=("MPL2")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('e06880eb02bd837b13f8a3d8560111a4ef01af48fe90c220d17e4e7364c9c74dad290f36f8f75ddd9f5d4908ad3a8a5ce44588171a3cfd7cb6db6e0936a2e996')

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
