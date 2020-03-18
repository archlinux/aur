# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=reflective-rapidjson
_llvmver=9
pkgname=reflective-rapidjson
pkgver=0.0.13
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='Code generator for serializing/deserializing C++ objects to/from JSON using Clang and RapidJSON'
license=('GPL')
depends=('c++utilities' 'rapidjson' "llvm-libs>=${_llvmver}.0.0" "llvm-libs<$((_llvmver + 1)).0.0" 'clang')
optdepends=("boost: use Boost.Hana instead of code generator"
            "$pkgname-doc: API documentation")
makedepends=('cmake' 'clang-tools-extra' 'llvm')
checkdepends=('cppunit' 'boost')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('978c4d70862f16bb926ba6481ebfd1e650dae02fdcf3c335070748f547745db3')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    .
  make
}

check() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make check
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install
}
