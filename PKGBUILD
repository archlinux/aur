# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libebml-git
pkgver=1.4.2.r19.g4039c7b
pkgrel=1
pkgdesc="Extensible Binary Meta Language library"
arch=('i686' 'x86_64')
url="https://github.com/Matroska-Org/libebml"
license=('LGPL')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('libebml' 'libebml.so')
conflicts=('libebml')
source=("git+https://github.com/Matroska-Org/libebml.git")
sha256sums=('SKIP')


pkgver() {
  cd "libebml"

  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libebml"

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
  cd "libebml"

  make -C "_build" DESTDIR="$pkgdir" install
}
