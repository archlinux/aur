# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=mdserve
pkgver=0.4.0
pkgrel=1
pkgdesc="Fast markdown preview server with live reload and theme support."
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/jfernandez/mdserve"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('2d773e48ac06b92b46c7dc82a6003d3a255ed4ef2b160caef1686fd32ba4692d14d1abde6772c76b90e0981e860fba1bbfea3d1d8f4f16f5f5713ad66f58bfa5')

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
  install -Dm755 -t "${pkgdir}/usr/bin/" target/release/mdserve
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
