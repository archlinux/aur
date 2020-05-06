# Maintainer: Erik Zenker <erikzenker at posteo dot de>
pkgname=hsm-git
pkgver=1.0
pkgrel=1
pkgdesc="The hana state machine (hsm) is a finite state machine library based on the boost hana meta programming library"
arch=('i686' 'x86_64')
url="https://github.com/erikzenker/hsm"
license=('MIT')
depends=(boost)
makedepends=('cmake' 'gcc')

source=("${pkgname}::git+https://github.com/erikzenker/hsm.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"


  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr
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
  ctest -vv
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="$pkgdir/" install
}