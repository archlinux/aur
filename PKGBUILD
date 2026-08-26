# Maintainer: PacmanicS <234399792+pacmanics at users dot noreply dot github dot com>
# SPDX-License-Identifier: 0BSD

pkgname=lindiskinfo
pkgver=1.0.0
pkgrel=2
pkgdesc="Qt-based S.M.A.R.T. and NVMe health monitor for Linux, inspired by CrystalDiskInfo"
arch=('x86_64')
url="https://github.com/pacmanics/lindiskinfo"
license=('GPL-3.0-or-later')

depends=(
  'gcc-libs'
  'hicolor-icon-theme'
  'polkit'
  'qt6-base'
  'smartmontools'
)

makedepends=(
  'cmake'
  'ninja'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/pacmanics/lindiskinfo/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
  '7e4c48ef6ceaedb1d2017826a181b2296d0ec7377fa1924b80f634cf18aa35d8'
)

build() {
  cmake \
    -S "${pkgname}-${pkgver}" \
    -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" \
    cmake --install build
}
