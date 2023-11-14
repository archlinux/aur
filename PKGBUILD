# Author: Roman Gilg <subdiff@gmail.com>
# Maintainer: abelian424

pkgname=wrapland-kwinft
pkgver=0.527.0
pkgrel=1
pkgdesc='Qt/C++ library wrapping libwayland'
arch=(x86_64 aarch64)
url="https://gitlab.com/kwinft/wrapland"
license=(LGPL)
depends=(libglvnd wayland qt5-base glibc gcc-libs)
provides=('wrapland')
conflicts=('wrapland')
makedepends=(doxygen appstream extra-cmake-modules git kdoctools5 qt5-doc qt5-tools wayland-protocols)
optdepends=('weston: allows extra autotests to be run during compile'
            'graphviz: provides dot for doxygen')
source=("https://gitlab.com/kwinft/wrapland/-/archive/wrapland@$pkgver/wrapland-wrapland@$pkgver.tar.gz")
sha1sums=('6508ec118b65b1306b5e034b102642e8ef82bc9d')

prepare() {
  mkdir -p $pkgname
  cd $pkgname
  tar -xvf ../wrapland-wrapland@$pkgver.tar.gz --strip-components=1
}

build() {
  mkdir -p build
  cd build
  cmake ../$pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_QCH=True
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
