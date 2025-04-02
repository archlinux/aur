# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: sudopluto
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=miracle-wm
pkgver=0.5.1
pkgrel=1
pkgdesc="Wayland compositor based on mir"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/miracle-wm-org/miracle-wm"
license=('GPL-3.0-or-later')
depends=(mir libnotify yaml-cpp)
makedepends=(cmake nlohmann-json glm boost)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dcbfe71692c5334d7aed578f7fbcbedd0536cac0d01244f8eea2034db25739ab')

build() {
  local _flags=(
    -DSYSTEMD_INTEGRATION=ON
  )

  cmake -B build -S "${pkgname}-${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"


  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
