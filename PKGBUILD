# Maintainer: Justus Tartz <aur at jrtberlin dot de>
pkgname=steam-boilr-gui
pkgver=1.4.3
pkgrel=1
_tag="v.${pkgver}"
_ver="v.${pkgver}"
pkgdesc="Synchronize games from other platforms into your Steam library"
arch=(x86_64)
license=('MIT')
url="https://github.com/PhilipK/BoilR"
makedepends=(cargo)
depends=(libx11
  libxext
  libxft
  libxinerama
  libxcursor
  libxrender
  libxfixes
  pango
  libpng
  mesa
  glu)
provides=('boilr-gui')
source=("https://github.com/PhilipK/BoilR/archive/refs/tags/${_tag}.tar.gz"
        "boilr.png"
        "boilr.desktop")
sha256sums=("dd631b458ff905bf5dda10798e093b5e944491015e13f633aa2c4f3e8d07f47c"
            "baab109c6311f05ddbf647aa384b42098db9308c27cb50537f99bb341930387f"
            "c8e71371c9dc39db087e79d5a32df1ee0f4dd2cf5d069e38b491c3b9812d8424")

prepare() {
  cd "${srcdir}/BoilR-${_ver}"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/BoilR-${_ver}"
  cargo build --frozen --release
}

check() {
  cd "${srcdir}/BoilR-${_ver}"
  cargo test --frozen
}

package() {
  install -Dm755 "${srcdir}/BoilR-${_ver}/target/release/boilr" "${pkgdir}/usr/bin/boilr-gui"
  install -Dm644 "${srcdir}/boilr.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/boilr.png" -t "${pkgdir}/usr/share/pixmaps/"
}

