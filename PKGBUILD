# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Jonas Witschel <diabonas@archlinux.org>

pkgname=qpwgraph
pkgver=0.5.2
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
sha512sums=('541d136eea8b4e6d0492ac64b42deca9ff0e7b6c8c201e279bd31a9f8c0e2058f2ba3b539eea75786ab177b71b5abc2618208b8a9d0179702d8fdfba2bca0dd0')
b2sums=('f2fca1a483474dd4e8f34a3afd233ba87affb56066dccd5797e71fb9084a9dd137f07b35aba7293395426f03249845192cdd885f0d8e393fca406a397d7d25cc')

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
