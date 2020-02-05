# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=passwordfile
pkgname=passwordfile
pkgver=5.0.3
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='C++ library to read/write passwords from/to encrypted files using AES-256-CBC via OpenSSL'
license=('GPL')
depends=('c++utilities' 'openssl')
optdepends=("$pkgname-doc: API documentation")
makedepends=('cmake')
checkdepends=('cppunit')
optdepends=("$pkgname-doc: API documentation")
install=
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('2e6fdb8dd920da6c99a1296bd2985545f752e205ff86ab2444825838d8086416')

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
