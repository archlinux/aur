# Maintainer: Jun Yan (jerrysteve1101@gmail.com)
# Contributor: tjbp (archlinux@tjbp.net)
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>
# Contributor: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=csdr
pkgver=0.18.2
pkgrel=3
pkgdesc="A simple DSP library and command-line tool for Software Defined Radio"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/jketterl/csdr'
license=('GPL-3.0-only')
depends=('fftw' 'libsamplerate')
makedepends=('cmake')
source=("https://github.com/jketterl/csdr/archive/$pkgver.tar.gz")
sha256sums=('70c55f6f3fd42042d4cc56ea100a08bb85b5fc8c60d4e4f596382c5275833468')

build() {
  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 # FIXME
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
# vim: set sw=2 ts=2 et:

