# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=reflective-rapidjson
pkgname=reflective-rapidjson
pkgver=0.0.3
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Code generator for serializing/deserializing C++ objects to/from JSON using Clang and RapidJSON'
license=('GPL')
depends=('c++utilities' 'llvm-libs' 'rapidjson' 'clang')
optdepends=("boost: use Boost.Hana instead of code generator")
optdepends=("$pkgname-doc: API documentation")
makedepends=('cmake' 'clang-tools-extra' 'boost' 'llvm')
checkdepends=('cppunit')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('0c5dbf53dd4f439adfb4c36d761b5036b6e6fec6df457ddb0fdc4bf93ede50c8')

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
