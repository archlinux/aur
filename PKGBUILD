# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_name=c++utilities
_reponame=cpp-utilities
pkgname=$_name-doc
pkgver=5.17.0
pkgrel=1
arch=('any')
pkgdesc='Common C++ classes and routines such as argument parser, IO and conversion utilities (API documentation)'
license=('GPL')
makedepends=('cmake' 'ninja' 'doxygen' 'dia' 'graphviz')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('05663fa9ca188cd7be44dc06f1257cfb39b0721443b158a5bbfdaf6400e66505')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    .
  ninja c++utilities_apidoc
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  DESTDIR="${pkgdir}" ninja install-api-doc
}
