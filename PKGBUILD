# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=what-the-port
pkgver=0.5.1
pkgrel=1
pkgdesc="Quickly lookup what a port is used for."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/cyqsimon/what-the-port"
license=("AGPL-3.0-or-later")
depends=("gcc-libs" "openssl")
makedepends=("cargo" "openssl")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('0e11ee5568ea151bbc82109855c2d8d1d892dbba29fe2122e1280ce5dd53eb684f0c1973eb964230e4086a88550ee622f8796a47660439ce1e3fc74f9c38cfb6')

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
