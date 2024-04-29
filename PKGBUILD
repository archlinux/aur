# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=molsketch
_PkgName=Molsketch
pkgver=0.8.1
pkgrel=1
pkgdesc="A 2D molecular editing tool"
url="http://molsketch.sourceforge.net"
arch=(x86_64)
license=(GPL2)
depends=(qt5-svg openbabel hicolor-icon-theme desktop-file-utils)
makedepends=(cmake ninja qt5-tools)
source=("https://downloads.sourceforge.net/$pkgname/$_PkgName-$pkgver-src.tar.gz")
sha256sums=('eb016f977024b6ff11804748d8436c29a9652a5632fdff13b26e42d0507f8a02')

prepare() {
  cd "$srcdir/$_PkgName-$pkgver"
  sed -i 's/CXX_STANDARD 14/CXX_STANDARD 17/' \
    libmolsketch/CMakeLists.txt \
    obabeliface/CMakeLists.txt \
    molsketch/CMakeLists.txt
}

build() {
  cd "$srcdir"
  cmake \
    -B build \
    -S $_PkgName-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D MSK_INSTALL_LIBS64=/lib \
    -G Ninja \
    -W no-dev
  cmake --build build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build
}
