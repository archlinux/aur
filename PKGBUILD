# Maintainer: Erik Zenker <erikzenker at posteo dot de>
pkgname=inotify-cpp-git
pkgver=v0.1.r0.g1505377
pkgrel=1
pkgdesc="C++ binding for the linux inotify library"
arch=('i686' 'x86_64')
url="https://github.com/erikzenker/inotify-cpp"
license=('MIT')
depends=(boost)
makedepends=('cmake')

source=("${pkgname}::git+https://github.com/erikzenker/inotify-cpp.git")
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
  make
}

check() {
  cd "${srcdir}/${pkgname}/build"
  make test
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="$pkgdir/" install
}
