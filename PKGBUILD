# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=qimgv
epoch=1
_pkgver=1.0.3-alpha
pkgver=${_pkgver/-}
pkgrel=1
pkgdesc="Qt6 image viewer with experimental webm playback"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/easymodo/qimgv"
license=(GPL-3.0-or-later )
depends=(
    glibc
    hicolor-icon-theme
    libgcc
    libstdc++
    qt6-base
    qt6-imageformats
    qt6-svg
    )
makedepends=(
    cmake
    qt6-tools
    )
optdepends=('kimageformats: support for more image formats')
source=(qimgv-${_pkgver}.tar.gz::https://github.com/easymodo/qimgv/archive/refs/tags/v${_pkgver}.tar.gz)
sha256sums=('94c03ee3d79db1891d0b6e5cdb084bcee71e14dd36c11831d15a42b18c1399c9')

build() {
  # Disable warning Detected locale "C" with character encoding "ANSI_X3.4-1968", which is not UTF-8.
  export LANG=C.UTF-8
  export LC_ALL=C.UTF-8

  local _flags=(
    )

  cmake -B build -S "qimgv-${_pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
