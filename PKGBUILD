# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-whatfeatures
pkgver=0.9.11
pkgrel=1
pkgdesc="A cargo plugin to display features, versions and dependencies of crates."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/museun/cargo-whatfeatures"
license=("Apache" "MIT")
depends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('989c1f322f229a23546ba62a938735c4cc707e5de682052e8103c1dcdc05835b31cfe6e393e05d9b4bcf7e1ab00344014d6cd753d22f57e69d4aed046f693237')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${pkgname}-${pkgver}
  # rustls is faster
  cargo build --release --frozen --no-default-features --features "rustls"
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 -t "${pkgdir}/usr/bin" target/release/cargo-whatfeatures
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-MIT
}
