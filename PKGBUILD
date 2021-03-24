# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libmatroska-git
pkgver=1.6.3.r7.g8cf9207
pkgrel=1
pkgdesc="C++ libary to parse Matroska files"
arch=('i686' 'x86_64')
url="https://matroska.org/index.html"
license=('LGPL')
depends=('glibc' 'libebml.so')
makedepends=('git' 'cmake')
provides=('libmatroska' 'libmatroska.so')
conflicts=('libmatroska')
source=("git+https://github.com/Matroska-Org/libmatroska.git")
sha256sums=('SKIP')


pkgver() {
  cd "libmatroska"

  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libmatroska"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    ./
  make -C "_build"
}

package() {
  cd "libmatroska"

  make -C "_build" DESTDIR="$pkgdir" install
}
