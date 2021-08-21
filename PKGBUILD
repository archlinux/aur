# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=openjpeg-git
pkgver=2.4.0.r45.g9bb0db7c
pkgrel=1
pkgdesc="An open-source JPEG 2000 codec written in C language"
arch=('i686' 'x86_64')
url="https://github.com/uclouvain/openjpeg"
license=('BSD')
depends=('glibc' 'lcms2' 'libpng' 'libtiff' 'zlib')
makedepends=('git' 'cmake' 'doxygen' 'jbigkit')
provides=('openjpeg2')
conflicts=('openjpeg2')
options=('staticlibs')
source=("git+https://github.com/uclouvain/openjpeg.git")
sha256sums=('SKIP')


pkgver() {
  cd "openjpeg"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "openjpeg"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_DOC=ON \
    ./
  make -C "_build"
}

package() {
  cd "openjpeg"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/openjpeg2"
}
