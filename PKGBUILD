# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Jonas Witschel <diabonas@archlinux.org>

pkgname=qpwgraph
pkgver=0.4.5
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=(x86_64)
url="https://gitlab.freedesktop.org/rncbc/qpwgraph"
license=(GPL3)
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
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('1c82cec62a4dd879f11cd687a93437de77e0bfbba1fa9ff726f60ae4a1af646e26fa86915a899b9bd3b646a3885eff7b3cc623532284945542808115857d2e93')
b2sums=('f48872b40b51d9a3cde3343075f231d1d6a3cb18b06773c006b6e489b5b2959d3d67777305174c4b9df2e141b1f5fdc9b2ed0774e0941b899832348506410ef9')

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
