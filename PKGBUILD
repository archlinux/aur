# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Jonas Witschel <diabonas@archlinux.org>

pkgname=qpwgraph
pkgver=0.6.0
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=(x86_64)
url="https://gitlab.freedesktop.org/rncbc/qpwgraph"
license=(GPL-2.0-or-later)
groups=(pro-audio)
depends=(
  gcc-libs
  glibc
  hicolor-icon-theme
  qt6-base
  qt6-svg
)
makedepends=(
  alsa-lib
  cmake
  pipewire
)
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('cf93170863860718e9fd56c312e72d0dabe19411250b06184fc2c8a516a6ba946ba694e59fbf4b0c288780a7644ac372fcf7949056934793e3ef01a9ec245406')
b2sums=('6f1617d8aaba4e2058dae8d9d66f9516444f3c93b74509df88da7e1c59db5e373d0dbfa9cf17a93e9ac9765255e7322d738b23a5faeb1f5f8fdfc4e8841dbe8d')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CONFIG_WAYLAND=ON
    -S $pkgname-v$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  depends+=(
  alsa-lib libasound.so
  pipewire libpipewire-0.3.so
  )
  DESTDIR="$pkgdir" cmake --install build
}
