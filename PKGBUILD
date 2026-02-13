# Maintainer: robertfoster
pkgname=cosmic-ext-quake-terminal
pkgver=0.1.0 # renovate: datasource=github-tags depName=m0rf30/cosmic-ext-quake-terminal
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
sha256sums=('46c5dd950018e931ab813f650e5ef974822b4eb048233e35b8ac2fdff76d8ac7')

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
