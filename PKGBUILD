# Author: Roman Gilg <subdiff@gmail.com>
# Maintainer: abelian424

pkgname=wrapland-kwinft
pkgver=0.600.0
pkgrel=1
pkgdesc='Qt/C++ library wrapping libwayland'
arch=(x86_64 aarch64)
url="https://github.com/winft/wrapland"
license=(LGPL)
depends=(libglvnd wayland glibc gcc-libs microsoft-gsl qt6-base)
provides=('wrapland')
conflicts=('wrapland')
makedepends=(doxygen appstream extra-cmake-modules git wayland-protocols)
optdepends=('weston: allows extra autotests to be run during compile'
            'graphviz: provides dot for doxygen'
            'qt6-tools' 'kdoctools' 'qt6-doc')
source=("https://github.com/winft/wrapland/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=('e30668661640d98a28bd5b330ae3bda5d55b8a03')

prepare() {
  mkdir -p $pkgname
  cd $pkgname
  tar -xvf ../v$pkgver.tar.gz --strip-components=1
}

build() {
  mkdir -p build
  cd build
  cmake ../$pkgname \
    -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
