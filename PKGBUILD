# Maintainer: Frestein <fresteinart@gmail.com>

_pkgname=telegram-tdlib
pkgname=${_pkgname}
pkgver=1.8.68
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
source=("${_pkgname}-${pkgver}::git+https://github.com/tdlib/td.git#commit=c15d3f5a5de6e3ba5839822c451152e5e18bb700")
sha256sums=('9e4c1e6e60fae9c72c20929b9e4655f6668c5a9d2fb1d28c6107969f7b572b2a')

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
