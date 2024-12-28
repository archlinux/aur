# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=miracle-wm
pkgver=0.4.0
pkgrel=1
pkgdesc="Wayland compositor based on mir"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/miracle-wm-org/miracle-wm"
license=('GPL-3.0-or-later')
depends=('mir' 'libnotify')
makedepends=('cmake' 'yaml-cpp' 'nlohmann-json')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('67b2766051ced0fd1dc4ebda3ab04473f6ca0a199cb68cf3c996650fbbefd35b')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSTEMD_INTEGRATION=ON
    
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
