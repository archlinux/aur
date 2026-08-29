# Maintainer: PacmanicS <234399792+pacmanics at users dot noreply dot github dot com>
# SPDX-License-Identifier: 0BSD

pkgname=lindiskinfo
pkgver=1.0.4
pkgrel=1
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

sha256sums=('a0c045b2bf92763c75292690041118602945e5e7d3fd67075dd72e2517622106')

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
