# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=libnuml
_name=NuML
pkgver=1.1.7
pkgrel=2
pkgdesc="Numerical Markup Language (NuML) for exchange and archiving of numerical results"
url="https://github.com/NuML/NuML"
license=('LGPL-2.1-or-later')
arch=('x86_64')
depends=('libsbml' 'libgcc' 'libstdc++')
makedepends=('cmake')
source=($_name-$pkgver.tar.gz::https://github.com/NuML/NuML/archive/v$pkgver.tar.gz)
sha256sums=('820d854355d80a3fe6dbe6c5428c45d42542541213cf0c3b3aee705f8ba1399f')

prepare() {
  cd "$_name-$pkgver"
  sed -i '/project(libnuml VERSION /{N;s/LANGUAGES CXX/LANGUAGES C CXX/;}' libnuml/CMakeLists.txt
}

build() {
  cmake -S "$_name-$pkgver/libnuml" -B build \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR:PATH=lib \
    -DLIBSBML_SHARED=ON \
    -DWITH_SWIG=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
