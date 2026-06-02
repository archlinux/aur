# Maintainer: Natalie Spiva <natalie@acreetionos.org>

pkgname=acreetionos-mediawriter
pkgver=5.3.1
pkgrel=1
pkgdesc="AcreetionOS USB Flasher — Write AcreetionOS images to USB drives"
arch=('x86_64')
url="https://github.com/spivanatalie64/AcreetionMediaWriter"
license=('GPL2')
depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'xz'
  'glibc'
  'hicolor-icon-theme'
)
makedepends=(
  'cmake'
  'ninja'
)
optdepends=(
  'polkit: Authorization for writing to disks'
  'udisks2: Disk Management Service for disk installation'
)
conflicts=('acreetionos-mediawriter-bin')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/AcreetionMediaWriter-${pkgver}"
  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON
  cmake --build build
}

package() {
  cd "${srcdir}/AcreetionMediaWriter-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
}
