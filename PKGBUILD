# Maintainer: DeltaCopy <7x0bb03yq@mozmail.com>
# Description: Builds Vinyl theme from https://github.com/ekaaty/vinyl-theme

# basic info
pkgname="vinyl"
_gitname="vinyl-theme"
pkgver=6.5.3
pkgrel=1
pkgdesc="Vinyl Theme for KDE Plasma 6"
url="https://github.com/ekaaty/vinyl-theme"
arch=('x86_64' 'aarch64')
license=("GPL-2.0-or-later")
build_dir="build_kf6"

makedepends=(
  'cmake'
  'extra-cmake-modules'
  'python'
  'python-cairosvg'
  'python-lxml'
  'xorg-xcursorgen'
)

options=(!emptydirs)

source=(
    "${url}/archive/refs/tags/v6.5.3.tar.gz"
)

sha256sums=('3610db21accb4f51bce125ad29897a041b9c66292161e23cd9521dd8916b9a18')

depends=(
  'kdecoration'
  'qt6-declarative'
  'kcoreaddons'
  'kcmutils'
  'kcolorscheme'
  'kconfig'
  'kguiaddons'
  'kiconthemes'
  'kwindowsystem'
  'kdoctools'
  'kpackage'
  'frameworkintegration'
  'libplasma'
)

depends=("${depends[@]}")

conflicts=(
  'vinyl-git'
  'vinyl-theme'
)

build() (
  local cmake_options=(
    -B $build_dir
    -S "$_gitname-${pkgver}"
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${cmake_options[@]}"

  cmake --build $build_dir
)

package() (
  DESTDIR="$pkgdir" cmake --install $build_dir --prefix /usr
  rm -rf "$pkgdir/usr/lib/cmake"
)
