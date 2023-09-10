# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Jonas Witschel <diabonas@archlinux.org>

pkgname=qpwgraph
pkgver=0.5.3
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
sha512sums=('754950bbea3953486c1a367479eee94cf616ee6d2940f61a7fbdd367846ea5f53d7bf5a3107005ce6a433470a8a098bee5953de23219b8f23310b283fc5cd37c')
b2sums=('be872867cbce91b0c938945ee2c071b12204886fbed54c561a779c52d34c784b4393c93155070747c090ebe3ea0b983d29297b659118d926ed4ec59cb9c1e2e6')

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
