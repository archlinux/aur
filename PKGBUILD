# Maintainer: DeltaCopy <7x0bb03yq@mozmail.com>
# Description: Builds Vinyl theme from https://github.com/ekaaty/vinyl-theme

# basic info
pkgname="vinyl"
_gitname="vinyl-theme"
pkgver=6.5.1
pkgrel=1
pkgdesc="Vinyl Theme for KDE Plasma 6"
url="https://github.com/ekaaty/vinyl-theme"
arch=('x86_64' 'aarch64')
license=("GPL-2.0-or-later")
pkgdir="$srcdir/fakeinstall_kf6"
build_dir="build_kf6"

makedepends=(
  'cmake'
  'extra-cmake-modules>=6.13.0'
  'git'
)

options=(!emptydirs !debug)

source=(
    "${url}/archive/refs/tags/v6.5.1.tar.gz"
)

sha256sums=('6eadaf300134a54e25a9a6e2af4dae5b0afc1f32c041ffdec2e8aa1a72d44baf')

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
  'python-cairosvg'
  'python-lxml'
  'xorg-xcursorgen'
  'libplasma>=6.3.0'
)

depends=("${depends[@]}")

conflicts=("vinyl-git")

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
  install -dm755 "$pkgdir.git"
  DESTDIR="$pkgdir" cmake --install $build_dir --prefix /usr
  rm -rf "$pkgdir/usr/lib/cmake"
)
