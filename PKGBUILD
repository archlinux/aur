# Maintainer: Jun Yan <jerrysteve1101 at gmail dot com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=csdr-git
_gitname=csdr
pkgver=0.18.2.r68.g1f15b8c
pkgrel=1
epoch=1
pkgdesc="A simple DSP library and command-line tool for Software Defined Radio"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/jketterl/csdr"
license=('GPL-3.0-only')
depends=('fftw' 'libsamplerate')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/jketterl/csdr.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local cmake_options=(
    -B build
    -S $_gitname
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
# vim: set sw=2 ts=2 et:
