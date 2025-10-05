# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=what-the-port
pkgver=0.5.3
pkgrel=1
pkgdesc="Quickly lookup what a port is used for."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/cyqsimon/what-the-port"
license=("AGPL-3.0-or-later")
depends=("gcc-libs" "openssl")
makedepends=("cargo" "openssl")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('ef0d17a7cbfb97d740a30d0fe31164a17420fd062621f3901bbc499c7e2d6ff3613fdb356fc7af23e6554cebe5c7b84226da50c83323922a7de719d3cb8c31bb')

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
