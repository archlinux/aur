# Author: Roman Gilg <subdiff@gmail.com>

pkgname=disman-kwinft
pkgver=5.19.0
_pkgname=0.519.0
pkgrel=1
pkgdesc='Qt/C++ display management library'
arch=(x86_64)
url="https://gitlab.com/kwinft/disman"
license=(LGPL)
depends=(qt5-x11extras libxrandr wrapland)
provides=("disman")
conflicts=("disman")
makedepends=(extra-cmake-modules)
source=("https://gitlab.com/kwinft/disman/-/archive/disman@$_pkgname/disman-disman@$_pkgname.tar.gz")
md5sums=('1175428b5986c0e1f7fd3298bdab8c24')

prepare() {
  tar -xvf disman-disman@$_pkgname.tar.gz
  mkdir -p "$srcdir"/build/make
}
  
build() {
  cd "$srcdir"/build
  cmake "$srcdir/disman-disman@$_pkgname" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}
