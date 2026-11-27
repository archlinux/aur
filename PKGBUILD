# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
pkgname="kwin-effect-rounded-corners"
pkgver=0.11.0
pkgrel=1
pkgdesc="Rounds the corners of your windows (wayland)"
url="https://github.com/matinlotfali/KDE-Rounded-Corners"
license=("GPL-3.0-only")
arch=('x86_64')

depends=('kwin')
makedepends=('cmake' 'extra-cmake-modules' 'ninja' 'vulkan-headers')


_pkgsrc="KDE-Rounded-Corners-$pkgver"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/matinlotfali/KDE-Rounded-Corners/archive/v${pkgver}.tar.gz")
sha256sums=('73833c9835262ad212075539edad771af75adc5be62ef027e55e09da2b97f0cb')

prepare() {
  # ensure Qt6
  sed -E -e 's&\bQUIET\b&REQUIRED&' -i "$_pkgsrc/cmake/qtversion.cmake"
}


build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
