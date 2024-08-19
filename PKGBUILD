# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-whatfeatures
pkgver=0.9.13
pkgrel=1
pkgdesc="A cargo plugin to display features, versions and dependencies of crates."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/museun/cargo-whatfeatures"
license=("Apache" "MIT")
depends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('6cb61ae4e50a1115c09de60d8bae1282769f954d84b4769c1f43031e50c061d15f280915f05e6d972d487f420c31cfb6c7d05258d4fef1786d455873df73cbbc')

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
