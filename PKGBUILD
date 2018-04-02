# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=reflective-rapidjson
_llvmver=6
pkgname=reflective-rapidjson
pkgver=0.0.4
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Code generator for serializing/deserializing C++ objects to/from JSON using Clang and RapidJSON'
license=('GPL')
depends=('c++utilities' 'rapidjson' "llvm-libs>=${_llvmver}.0.0" "llvm-libs<$((_llvmver + 1)).0.0" 'clang')
optdepends=("boost: use Boost.Hana instead of code generator")
optdepends=("$pkgname-doc: API documentation")
makedepends=('cmake' 'clang-tools-extra' 'boost' 'llvm')
checkdepends=('cppunit')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('5f670d57f6505a4f6294c61e013260289311f13481bb5f8346b9a10f94364c0a')

prepare() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
}

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr"
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
