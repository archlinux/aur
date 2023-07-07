# Maintainer: Maximilian Rogge <me@maximilianrogge.com>
pkgname=i3-auto-tiling
pkgver=0.3.3
pkgrel=1
pkgdesc="Automatic, optimal tiling for i3wm"
arch=('x86_64')
url="https://gitlab.com/ximnoise/i3-auto-tiling"
makedepends=('cargo')
license=('MIT')
source=("${pkgname}-v${pkgver}.tar.gz::https://gitlab.com/ximnoise/i3-auto-tiling/-/archive/v${pkgver}/i3-auto-tiling-v${pkgver}.tar.gz")
sha512sums=('SKIP')


prepare() {
  cd "${pkgname}-v${pkgver}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build(){
  cd "${pkgname}-v${pkgver}"
  CARGO_INCREMENTAL=0 cargo build --release --locked --offline
}

package() {
  cd "${pkgname}-v${pkgver}"
  install -D -m755 "target/release/i3-auto-tiling" "${pkgdir}/usr/bin/i3-auto-tiling"
}
