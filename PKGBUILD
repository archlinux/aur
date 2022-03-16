# Maintainer: Justus Tartz <aur at jrtberlin dot de>
pkgname=steam-boilr-gui
pkgver=0.9.9
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
sha256sums=('06eb0f7747bd54d62f7da8c3bdf139a746cf7212a65e4b1a8cfa71bba3a16661')

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

