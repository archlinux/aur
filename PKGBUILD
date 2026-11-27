# Maintainer: Frestein <fresteinart@gmail.com>

_pkgname=telegram-tdlib
pkgname=${_pkgname}
pkgver=1.8.69
pkgrel=1
pkgdesc='Cross-platform library for building Telegram clients'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://core.telegram.org/tdlib'
license=('Boost')
depends=('openssl' 'zlib')
makedepends=('make' 'gcc' 'cmake' 'gperf' 'git')
provides=('telegram-tdlib')
conflicts=('telegram-tdlib')
options=('!lto' '!debug')
source=("${_pkgname}-${pkgver}::git+https://github.com/tdlib/td.git#commit=0e88653dcbf4e44c73cb655a05b58cd749a91169")
sha256sums=('8ef025c43f175be1d7d51c852069153ea96a92ce154788a4d292eeda26c096cb')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}" || exit
  mkdir -p build
  cd build || exit
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build" || exit
  DESTDIR="$pkgdir" cmake --build . --target install
}
