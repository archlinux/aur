# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=what-the-port
pkgver=0.1.0
pkgrel=1
pkgdesc="Quickly lookup what a port is used for."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/cyqsimon/what-the-port"
license=("AGPL-3.0-or-later")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('3cfbeb3980418c7339fdb135e3092225e0fcc93cd59b911599ebbbf4591857d4de01610e9e31dfac978159beab8141670a5051ded7083612e4737be940725a54')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --frozen
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 -t "${pkgdir}/usr/bin" target/release/wtp
}
