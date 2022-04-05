# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=cpp-utilities
pkgname=c++utilities
pkgver=5.14.0
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='Common C++ classes and routines such as argument parser, IO and conversion utilities'
license=('GPL')
depends=('gcc-libs')
optdepends=("$pkgname-doc: API documentation")
makedepends=('cmake' 'ninja')
checkdepends=('cppunit')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('7a173bb2355a9b5fef17d3fe6795f026f58afe63b1295f8567c042422e2cde0e')

prepare() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
}

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    .
  ninja
}

check() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  ninja check
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  DESTDIR="${pkgdir}" ninja install
}
