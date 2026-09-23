# Maintainer: Frestein <fresteinart@gmail.com>

_pkgname=telegram-tdlib
pkgname=${_pkgname}
pkgver=1.8.67
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
source=("${_pkgname}-${pkgver}::git+https://github.com/tdlib/td.git#commit=bc9c263e2bfee06aaab41e82db51a103376030bc")
sha256sums=('1ea4d7666f98d1a45cc1c81bde9aee5de4f81530b24c864a539a50c3d732aaf9')

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
