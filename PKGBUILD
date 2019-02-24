# Maintainer: Alexey Andreyev <aa13q@ya.ru>

_gitname=libqmatrixclient
pkgname=qt5-matrixclient-git
pkgver=r1288.293b547
pkgrel=1
pkgdesc="A Qt5 library to write cross-platfrom clients for Matrix."
arch=(i686 x86_64 armv7 aarch64)
url="https://matrix.org/docs/projects/sdk/libqmatrixclient.html"
license=(LGPLv2.1)
depends=(qt5-base)
makedepends=(cmake git)
provides=(libqmatrixclient)
conflicts=(libqmatrixclient)
source=("git+https://github.com/QMatrixClient/$_gitname")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../$_gitname" \
    -DCMAKE_INSTALL_INCLUDEDIR=include/$_gitname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
