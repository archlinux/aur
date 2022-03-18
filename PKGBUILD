# Maintainer: Justus Tartz <aur at jrtberlin dot de>
pkgname=steam-boilr-gui
pkgver=0.9.13
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
sha256sums=('a1c67d59af072e48a7081c089381fe68c180ff15aad51edeedb4a781fcdc979c')

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

