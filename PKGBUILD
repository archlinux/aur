# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-modules
pkgver=0.9.0
pkgrel=1
pkgdesc="A cargo plugin for showing an overview of a crate's modules."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/regexident/cargo-modules"
license=("MPL2")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('b4c05280b6223ee9218b5a21e450be1ae153aaf5f7c5213bb44bdc2075513982d3481087b7b09d952a0934b214179903fa985e1edfb99c96412ff5beae24b787')

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
