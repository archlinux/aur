# Maintainer: robertfoster
pkgname=cosmic-ext-quake-terminal
pkgver=0.2.0 # renovate: datasource=github-tags depName=m0rf30/cosmic-ext-quake-terminal
pkgrel=1
pkgdesc='Quake-style dropdown terminal for COSMIC Desktop'
arch=(aarch64 x86_64)
url=https://github.com/m0rf30/cosmic-ext-quake-terminal
license=(GPL-3.0-only)
depends=(
  cosmic-icon-theme
  gcc-libs
  glibc
  libxkbcommon
  wayland
)
makedepends=(
  cargo
  clang
  just
  lld
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('3de0e6a42b1d127885bae2e3f54bbd51cf206dc220351d98ecc00221f1e04b02')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked
}

build() {
  cd "${pkgname}-${pkgver}"
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
