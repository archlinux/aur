#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=opencrg
pkgver=1.2.0
pkgrel=1
pkgdesc="Format to store high-precision elevation data from road surface scans for simulation"
arch=(x86_64)
url="https://www.asam.net/standards/detail/opencrg/"
license=(GPL)
depends=()
makedepends=(cmake ninja)
optdepends=()
options=()
source=("${pkgname}_${pkgver}.zip::https://www.asam.net/standard_downloads/standard_download60bf5172732e7_13439.zip"
        "CMakeLists.txt"
        )
sha256sums=('8a55243c1f3f1d13b3fc8542137105647bd6d5d6782d9f7ca18be0e2639309a2'
            'bed2ba22e267fe3200614e6e61829c9d3dc04fc7a046d6899869c3a018ae608c')

prepare() {
  cp "${srcdir}"/CMakeLists.txt "${srcdir}"/ASAM_OpenCRG_BS_V${pkgver}/c-api/
}

build() {
  cmake -G Ninja -S "${srcdir}"/ASAM_OpenCRG_BS_V${pkgver}/c-api/ -B build \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr
  ninja -C build ${MAKEFLAGS:--j1}
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
