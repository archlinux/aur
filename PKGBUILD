# Maintainer: Erik Zenker <erikzenker at posteo dot de>
pkgname=function2-git
pkgver=4.1.0.r8.gfb903bb
pkgrel=1
pkgdesc="fu2::function an improved drop-in replacement to std::function"
arch=('i686' 'x86_64')
url="https://github.com/Naios/function2.git"
license=('MIT')
depends=()
makedepends=('cmake' 'clang')

source=("${pkgname}::git+https://github.com/Naios/function2.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DBUILD_TESTING=OFF
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}/build"
  cmake --build .
}

check() {
  cd "${srcdir}/${pkgname}/build"
  ctest -VV
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="$pkgdir/" install
}
