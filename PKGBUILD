# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=molsketch
_PkgName=Molsketch
pkgver=0.8.3
pkgrel=1
pkgdesc="A 2D molecular editing tool"
url="http://molsketch.sourceforge.net"
arch=(x86_64)
license=(GPL-2.0-only)
depends=(qt5-svg openbabel hicolor-icon-theme desktop-file-utils)
makedepends=(cmake ninja qt5-tools)
source=("https://downloads.sourceforge.net/$pkgname/$_PkgName-$pkgver-src.tar.gz")
sha256sums=('da565ebf54046dc30a93e59c5d197fb66f6e1cec0c6e343cd77ad0f7b1c05da9')

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
