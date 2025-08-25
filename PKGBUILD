# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Košava <kosava at archlinux dot us>

pkgname=yarock
pkgver=1.5.1
pkgrel=1
pkgdesc="Qt Modern Music Player with collection browse based on cover art"
arch=(x86_64)
url="https://github.com/sebaro/Yarock"
license=(GPL-3.0-or-later)
depends=(qt6-base qt6-multimedia htmlcxx taglib)
makedepends=(cmake qt6-tools vulkan-headers)
source=("yarok-${pkgver}.tar.gz::https://github.com/sebaro/Yarock/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('84842c2bce879b657737edb61441207d3067f2f42a401364a0166923c9060042')

build() {
  local _flags=(
    -DENABLE_QTMULTIMEDIA=ON
    -DENABLE_MPV=OFF
    -DENABLE_VLC=OFF
    -DENABLE_PHONON=OFF
  )

  cmake -B build -S "Yarock-${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
