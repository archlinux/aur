# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=miracle-wm
pkgver=0.3.7
pkgrel=1
pkgdesc="Wayland compositor based on mir"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/miracle-wm-org/miracle-wm"
license=('GPL-3.0-or-later')
depends=('mir' 'yaml-cpp' 'nlohmann-json' 'libnotify')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3097afce7f1abfa0b23fb3abea828ebb7a93a8da6aa6ce76cd52fcdaafb02ebf')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  [ -d build ] && rm -r build
  mkdir build
  cd build

  cmake ..  -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSTEMD_INTEGRATION=ON
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"/build
  make DESTDIR="${pkgdir}" install
}
