# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_name=tagparser
_reponame=tagparser
pkgname=$_name-doc
pkgver=11.3.0
pkgrel=1
arch=('any')
pkgdesc='C++ library for reading and writing MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska tags (API documentation)'
license=('GPL')
makedepends=('cmake' 'ninja' 'iso-codes' 'doxygen' 'dia' 'graphviz' 'c++utilities')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('5c89fae9d87b94225e585acda58072ae24e09f3af87e5af742ec077d78230e9f')

prepare() {
  [[ -d tagparser ]] || ln -s "${PROJECT_DIR_NAME:-$_reponame-$pkgver}" tagparser
}

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    .
  ninja ${_name}_apidoc
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  DESTDIR="${pkgdir}" ninja install-api-doc
}
