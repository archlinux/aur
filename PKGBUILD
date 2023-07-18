# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Jonas Witschel <diabonas@archlinux.org>

pkgname=qpwgraph
pkgver=0.5.1
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
sha512sums=('95952ab1f7e7ca17ccb972764212f0ce68d475c5b2812ce7b334761c04d1014c6274f55987c889c0d1a9a4e97cf9463c49bbafaa96751d9aad4b373866e11e76')
b2sums=('99b05df1270c6422749749bf2afabc78c4b85fda8ae88d0fe64afd3a014c265b7870bd5396472bdb98cdc9f278f331809df8c3293c9c204e5051fb7f1831f641')

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
