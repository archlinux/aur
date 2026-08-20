# Maintainer: kaolinite7

pkgname=blas-clblast
_name=CLBlast
pkgver=1.7.0
pkgrel=1
pkgdesc='Tuned OpenCL BLAS library (with Netlib CBlas C API)'
url='https://github.com/CNugteren/CLBlast'
arch=('x86_64')
license=('Apache-2.0')
depends=(
  glibc
  libgcc
  libstdc++
  ocl-icd
)
makedepends=(
  cmake
  opencl-headers
)
provides=('libclblast.so' 'clblast')
conflicts=('clblast')
source=(https://github.com/CNugteren/${pkgname/blas-/}/archive/${pkgver}/${pkgname/blas-/}-${pkgver}.tar.gz)
sha256sums=('cac83330a6110214f2b7efc8e46062536f40ba96122f3b2a074a51497d8ca9e7')

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
