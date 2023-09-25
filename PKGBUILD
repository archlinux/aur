# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
# Contributor: Arnaud Berthomier <oz-cypr-dot-io>

_pkgname=libtd-dev
pkgname=${_pkgname}
pkgver=1.8.19
pkgrel=1
pkgdesc='Cross-platform library for building Telegram clients (Development version)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://core.telegram.org/tdlib'
license=('Boost')
depends=('openssl' 'zlib')
makedepends=('make' 'gcc' 'cmake' 'gperf' 'git')
provides=('telegram-tdlib' 'libtd' 'libtdjson.so')
conflicts=('telegram-tdlib' 'libtd')
_commit=2589c3fd46925f5d57e4ec79233cd1bd0f5d0c09  # commit=Update version to 1.8.19.
source=("git+https://github.com/tdlib/td.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cmake \
    -B build \
    -S td \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
