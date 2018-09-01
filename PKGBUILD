# Maintainer: dmidge <quelque_ri1 at caramail point fr>
pkgname=trisycl-git
_pkgver=1.2.1
pkgver=1.2.1.r1159.6172c33a
pkgrel=2
pkgdesc="It is the open source implementation of the SYCL Khronos specification, to do some kind of OpenCL like programming in C++ fashion."
arch=('x86_64' 'i686')
url="https://github.com/triSYCL/triSYCL.git"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('boost')
makedepends=('git' 'cmake' 'boost')
source=(git+git://github.com/triSYCL/triSYCL)
md5sums=('SKIP')

pkgver() {
  cd triSYCL
  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd triSYCL
  mkdir -p build
  cd build
  #cmake .. -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DTRISYCL_OPENCL=ON
  cmake .. -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_INSTALL_PREFIX=/usr
  make ..
}

package() {
  cd "$srcdir"/triSYCL/build
  make DESTDIR="$pkgdir" install
}
