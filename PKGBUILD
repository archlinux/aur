# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=passwordfile
pkgname=passwordfile
pkgver=5.1.0
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='C++ library to read/write passwords from/to encrypted files using AES-256-CBC via OpenSSL'
license=(GPL-2.0-or-later)
depends=('c++utilities' 'openssl' 'zlib')
optdepends=("$pkgname-doc: API documentation")
makedepends=('cmake' 'ninja')
checkdepends=('cppunit')
provides=(libpasswordfile.so)
install=
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('09a8fd706690fc4bdb8be3b541b37d71828f92c25e88b3f5dc56577aa83dda3d')

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
  depends+=('libc++utilities.so' 'libcrypto.so' 'libz.so')

  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  DESTDIR="${pkgdir}" ninja install
}
