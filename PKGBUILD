# Maintainer: Mike Cuche <mike@cuche.cc>

pkgname=snowemu
pkgver=1.3.1
pkgrel=1
pkgdesc="A friendly and accurate 68k Macintosh emulator"
arch=(i686 x86_64 aarch64)
url="https://snowemu.com/"
license=(MIT)
options=(!debug !lto)
depends=(sdl2)
makedepends=(cargo)
source=(https://github.com/twvd/snow/archive/refs/tags/v${pkgver}.tar.gz)

sha256sums=('db733fc8948e30c8b8b4d78ae60991d84c7df63003d6bb8d3630379338dae3a5')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd $srcdir/snow-${pkgver}
  cargo fetch --locked --target host-tuple
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd $srcdir/snow-${pkgver}
  cargo build --frozen --release
}

package() {
  cd $srcdir/snow-${pkgver}
  install -Dm755 "target/release/snowemu" "${pkgdir}/usr/bin/snowemu"
  install -Dm644 "assets/snow.desktop" "${pkgdir}/usr/share/applications/snow.desktop"
  install -Dm644 "assets/snow_icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/snow_icon.png"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
