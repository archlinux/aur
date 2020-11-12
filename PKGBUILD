# Maintainer: Erik Zenker <erikzenker at posteo dot de>
pkgname=cppcoro-cmake-git
pkgver=heads.makepkg.r0.g297ee38
pkgrel=1
pkgdesc="A coroutine library for C++"
arch=('i686' 'x86_64')
url="https://github.com/Garcia6l20/cppcoro.git"
license=('MIT')
depends=()
makedepends=('cmake' 'gcc')

source=("${pkgname}::git+https://github.com/Garcia6l20/cppcoro.git")
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
  git describe --all --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/\//./g'
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
