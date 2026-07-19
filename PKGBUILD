# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=molsketch
_PkgName=Molsketch
pkgver=0.8.4
pkgrel=1
pkgdesc="A 2D molecular editing tool"
url="http://molsketch.sourceforge.net"
arch=(x86_64 aarch64)
license=(GPL-2.0-only)
depends=(qt6-svg openbabel hicolor-icon-theme desktop-file-utils)
makedepends=(cmake ninja qt6-tools)
source=("https://downloads.sourceforge.net/$pkgname/$_PkgName-$pkgver-src.tar.gz")
sha256sums=('a5ff8a4352a547da6b01add3cf46c3d926afac1b455aa8effc08beba7c2da2c1')

build() {
  cd "$srcdir"
  cmake \
    -B build \
    -S $_PkgName-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D MSK_INSTALL_LIBS64=/lib \
    -D MSK_QT6=ON \
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffile-prefix-map=$srcdir=." \
    -G Ninja \
    -W no-dev
  cmake --build build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build
}
