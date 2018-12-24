# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=passwordfile
pkgname=passwordfile
pkgver=4.0.0
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
sha256sums=('4918322b65eb4d70114ff427016decb9dc799c76a97b699b88db4790ae7609e1')

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
