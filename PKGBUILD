# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
# Contributor: Arnaud Berthomier <oz-cypr-dot-io>

_pkgname=libtd-dev
pkgname=${_pkgname}
pkgver=1.8.2
pkgrel=1
pkgdesc='Cross-platform library for building Telegram clients (Development version)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://core.telegram.org/tdlib'
license=('Boost')
depends=('openssl' 'zlib')
makedepends=('make' 'gcc' 'cmake' 'gperf' 'git')
provides=('telegram-tdlib' 'libtd')
conflicts=('telegram-tdlib' 'libtd')
_commit=3f54c301ead1bbe6529df4ecfb63c7f645dd181c  # commit=Update version to 1.8.2.
source=("git+https://github.com/tdlib/td.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  mkdir -p td/build
  cd td/build
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
}

package() {
  cd td/build
  mkdir -p ${pkgdir}/usr
  cmake --build . --target install
}
