# Maintainer: Alexey Andreyev <aa13q@ya.ru>

_gitname=libQtOlm
pkgname=qt5-olm-git
pkgver=r70.750ae3a
pkgrel=1
pkgdesc="A Qt wrapper for libolm"
arch=(i686 x86_64 armv7 aarch64)
url="https://gitlab.com/b0/libQtOlm"
license=(GPLv3.0)
depends=(qt5-base libolm)
makedepends=(cmake git)
provides=(qt5-olm)
conflicts=(qt5-olm)
source=("git+https://gitlab.com/b0/$_gitname")
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
