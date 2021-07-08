# Maintainer: Hannah Kiekens <hannahkiekens@gmail.com>
 
pkgname=qcoro-git
pkgver=r100.a29ded2
pkgrel=1
pkgdesc='C++ Coroutine library for Qt'
arch=(x86_64 armv6h armv7h aarch64)
url="https://qcoro.dvratil.cz/"
license=(MIT)
depends=(qt5-base )
makedepends=(git cmake)
provides=(qcoro)
conflicts=(qcoro)
source=("git+https://github.com/danvratil/qcoro.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  cmake . \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}
 
package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
