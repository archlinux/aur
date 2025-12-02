# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=antimicrox-git
pkgver=3.5.1.r10.g805a323c
pkgrel=2
pkgdesc='Map keyboard and mouse actions to gamepad buttons, inspired by qjoypad. Antimicro fork'
url="https://github.com/AntiMicroX/antimicroX"
arch=(x86_64 i686 pentium4 armv7h aarch64)
license=(GPL-3.0-or-later)
depends=(qt6-base libxtst hicolor-icon-theme sdl2)
makedepends=(git cmake qt6-tools itstool extra-cmake-modules vulkan-headers)
conflicts=(antimicrox)
provides=(antimicrox)
source=("git+https://github.com/AntiMicroX/antimicroX.git")
sha256sums=('SKIP')

pkgver() {
  cd antimicroX
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/,/./g'
}

build() {
  local _flags=(
    -DANTIMICROX_PKG_VERSION="$pkgver"
    -DUSE_QT6_BY_DEFAULT=ON
  )

  cmake -B build -S "antimicroX" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
