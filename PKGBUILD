# Maintainer: Frestein <fresteinart@gmail.com>

_pkgname=telegram-tdlib
pkgname=${_pkgname}
pkgver=1.8.70
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
source=("${_pkgname}-${pkgver}::git+https://github.com/tdlib/td.git#commit=23383aef218a3123f02b744bfa91bde21056a814")
sha256sums=('288ae9010a14131d9e65d46d2daac9a2f5337efd533552421201a29378536269')

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
