# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=molsketch
_PkgName=Molsketch
pkgver=0.8.0
pkgrel=1
pkgdesc="A 2D molecular editing tool"
url="http://molsketch.sourceforge.net"
arch=(x86_64)
license=(GPL2)
depends=(qt5-svg openbabel hicolor-icon-theme desktop-file-utils)
makedepends=(cmake qt5-tools)
source=("https://downloads.sourceforge.net/$pkgname/$_PkgName-$pkgver-src.tar.gz")
sha256sums=('329c787c792dc6a040926770aa0da95ef120bef19440f6e0ab12b05ca8e126e4')

prepare() {
  cd "$srcdir/$_PkgName-$pkgver"
  sed -i 's/CXX_STANDARD 14/CXX_STANDARD 17/' \
    libmolsketch/CMakeLists.txt \
    obabeliface/CMakeLists.txt \
    molsketch/CMakeLists.txt
}

build() {
  cd "$srcdir"
  cmake -B build -S $_PkgName-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMSK_INSTALL_LIBS64=/lib
  cmake --build build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build
}
