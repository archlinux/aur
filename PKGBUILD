# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=libsedml
_pkgname=libSEDML
pkgver=2.0.31
pkgrel=1
pkgdesc="Simulation Experiment Description - Markup Language"
url=https://github.com/fbergmann/libSEDML
license=('BSD')
arch=('i686' 'x86_64')
depends=('libnuml')
source=($_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('f61954df7ead556eced3d8559e58fd01c9bb89766196aedbd1518ec640ed2a06')

build() {
  cd "$_pkgname-$pkgver"
  mkdir -p build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    ..
  make
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver/build
  DESTDIR="$pkgdir" cmake -P cmake_install.cmake
  rm -rf "$pkgdir"/libnuml/usr/share/cmake
}
