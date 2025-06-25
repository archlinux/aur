# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=libsedml
_pkgname=libSEDML
pkgver=2.0.33
pkgrel=1
pkgdesc="Simulation Experiment Description - Markup Language"
url=https://github.com/fbergmann/libSEDML
license=('BSD')
arch=('x86_64')
depends=('libnuml')
source=($_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('a3f69ecb5dc1084343d4de5dc0990bdd9def2f7eb819986015d33ca9735dbe76')

prepare() {
  cd "$_pkgname-$pkgver"
  sed -i "s/LANGUAGES CXX/LANGUAGES C CXX/" CMakeLists.txt
}

build() {
  cd "$_pkgname-$pkgver"
  mkdir -p build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    ..
  make
}

package() {
  cd "$_pkgname-$pkgver/build"
  DESTDIR="$pkgdir" cmake -P cmake_install.cmake
  rm -rf "$pkgdir"/libnuml/usr/share/cmake
}
