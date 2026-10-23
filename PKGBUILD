# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=libnuml
_name=NuML
pkgver=1.1.8
pkgrel=1
pkgdesc="Numerical Markup Language (NuML) for exchange and archiving of numerical results"
url="https://github.com/NuML/NuML"
license=('LGPL-2.1-or-later')
arch=('x86_64')
depends=('libsbml' 'libgcc' 'libstdc++')
makedepends=('cmake')
source=($_name-$pkgver.tar.gz::https://github.com/NuML/NuML/archive/v$pkgver.tar.gz)
sha256sums=('4d0a3b20c88a5059ea0ab992f27787187a88358506dd06dfc21ccbb5f7cf95f9')

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
