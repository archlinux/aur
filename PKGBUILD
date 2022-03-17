# Maintainer: Justus Tartz <aur at jrtberlin dot de>
pkgname=steam-boilr-gui
pkgver=0.9.12
pkgrel=1
pkgdesc="Synchronize games from other platforms into your Steam library"
arch=(x86_64)
license=('MIT')
url="https://github.com/PhilipK/BoilR"
makedepends=(cargo
  libx11
  libxext
  libxft
  libxinerama
  libxcursor
  libxrender
  libxfixes
  pango
  libpng
  mesa)
provides=('boilr-gui')
source=("https://github.com/PhilipK/BoilR/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('7b0ff9962d3030d451565b3b2071115347d228a0a938eb8c8d81f47066d187d1')

prepare() {
  cd "${srcdir}/BoilR-v.${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/BoilR-v.${pkgver}"
  cargo build --frozen --release --features ui
}

check() {
  cd "${srcdir}/BoilR-v.${pkgver}"
  cargo test --frozen --features ui
}

package() {
  install -Dm755 "${srcdir}/BoilR-v.${pkgver}/target/release/boilr" "${pkgdir}/usr/bin/boilr-gui"
}

