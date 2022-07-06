# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-modules
pkgver=0.5.9
pkgrel=1
pkgdesc="A cargo plugin for showing an overview of a crate's modules."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/regexident/cargo-modules"
license=("MPL2")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('56fe3359b3941a90c4c0aac062de4dadcb498550c701bcb0efadbdd88d01588fd72cc981f76336d579536661f87a97b6a9ea86a8142ded7bca2c44508e3f6f4b')

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
