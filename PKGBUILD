# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname="wsjtx"
pkgver=3.0.0
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)"
url="https://sourceforge.net/projects/wsjt/"
license=('GPL-3.0-only')
arch=('i686' 'x86_64' 'aarch64')

depends=(
  'fftw'
  'glibc'
  'hamlib'
  'libboost_filesystem.so'
  'libboost_log_setup.so'
  'libboost_log.so'
  'libboost_thread.so'
  'libgcc'
  'libgfortran'
  'libgomp'
  'libstdc++'
  'libusb'
  'qt5-base'
  'qt5-multimedia'
  'qt5-serialport'
  'qt5-websockets'
  'readline'
)
makedepends=(
  'asciidoc'    # manpages
  'asciidoctor' # other docs
  'boost'
  'cmake'
  'gcc-fortran'
  'ninja'
  'qt5-tools'
)

options=('!lto')

_pkgsrc="$pkgname-$pkgver"
source=("$_pkgsrc.tar.gz"::"https://github.com/WSJTX/wsjtx/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('eb8b72941b574f1ad16aa0b50ae8b0cc7eaa2943f9b7d4797ff910bf518042a7')

build() {
  local _cmake_options=(
    -B build
    -S ${_pkgsrc}
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
