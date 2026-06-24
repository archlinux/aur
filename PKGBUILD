# Maintainer: Frestein <fresteinart@gmail.com>

_pkgname=telegram-tdlib
pkgname=${_pkgname}
pkgver=1.8.65
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
source=("${_pkgname}-${pkgver}::git+https://github.com/tdlib/td.git#commit=a8f21f5230172634becc1739050ef23ecd6ea291")
sha256sums=('a17dd21ccfe36bbf9c6145320dc0ffce97388737d018762fcb57e03298cdd0ac')

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
