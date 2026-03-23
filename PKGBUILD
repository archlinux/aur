# Maintainer: kaolinite

pkgname=blas-clblast
_name=CLBlast
pkgver=1.6.3
pkgrel=2
pkgdesc='Tuned OpenCL BLAS library (with Netlib CBlas C API)'
url='https://github.com/CNugteren/CLBlast'
arch=('x86_64')
license=('Apache-2.0')
depends=(
  gcc-libs
  glibc
  ocl-icd
)
makedepends=(
  cmake
  opencl-headers
)
provides=('libclblast.so' 'clblast')
conflicts=('clblast')
source=(https://github.com/CNugteren/${pkgname/blas-/}/archive/${pkgver}/${pkgname/blas-/}-${pkgver}.tar.gz)
sha256sums=('c05668c7461e8440fce48c9f7a8966a6f9e0923421acd7c0357ece9b1d83f20e')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D NETLIB=ON
    -S $_name-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim: ts=2 sw=2 et:
