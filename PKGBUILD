# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=tagparser
pkgname=tagparser
pkgver=8.2.0
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='C++ library for reading and writing MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska tags'
license=('GPL')
depends=('c++utilities' 'zlib')
makedepends=('cmake')
checkdepends=('cppunit' 'openssl')
optdepends=("$pkgname-doc: API documentation")
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('c695b21327510840b37fe474dde698628a1215b5b7e66591d2393c628f528302')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" .
  make
}

check() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  if [[ $TEST_FILE_PATH ]]; then
    make check
  else
    msg2 'Skipping execution of testsuite because the environment variable TEST_FILE_PATH is not set.'
  fi
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install
}
