# Maintainer: Justus Tartz <aur at jrtberlin dot de>
pkgname=steam-boilr-gui
pkgver=0.9.8
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
sha256sums=('3c26d065241858e3c16a0a15027d2401f79c9d2e67e3ffeaf64e6a0a1ac0a7da')

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

