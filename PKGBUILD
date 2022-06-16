# Author: Roman Gilg <subdiff@gmail.com>

pkgname=disman-kwinft
pkgver=5.25.0
_pkgver=0.525.0
pkgrel=1
pkgdesc='Qt/C++ display management library'
arch=(x86_64)
url="https://gitlab.com/kwinft/disman"
license=(LGPL)
depends=(qt5-x11extras libxrandr plasma-framework wrapland)
provides=("disman")
conflicts=("disman")
makedepends=(extra-cmake-modules)
source=("https://gitlab.com/kwinft/disman/-/archive/disman@$_pkgver/disman-disman@$_pkgver.tar.gz")
md5sums=('25de500c61c7f24c847bea5773bb06d2')

prepare() {
  tar -xvf disman-disman@$_pkgver.tar.gz
  mkdir -p "$srcdir"/build/make
}
  
build() {
  cd "$srcdir"/build
  cmake "$srcdir/disman-disman@$_pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}
