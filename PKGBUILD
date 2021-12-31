# Maintainer: Fox archlinux@foxfromabyss.dev

pkgname=telegram-tdlib-git
pkgver=1.8.0
pkgrel=1
pkgdesc='Cross-platform library for building Telegram clients'
arch=('i686' 'x86_64' 'armv7h')
url='https://core.telegram.org/tdlib'
license=('Boost')
depends=('openssl' 'zlib')
makedepends=('make' 'gcc' 'cmake' 'gperf' 'git')
provides=('telegram-tdlib=${pkgver}' 'telegram-tdlib')
conflicts=('telegram-tdlib')
source=("git+https://github.com/tdlib/td.git")
sha256sums=('SKIP')

pkgver() {
  cat td/td/telegram/Td.h | grep TDLIB_VERSION | sed 's/[^0-9,.]*//g'
}

build() {
  mkdir -p "td/build"
  cd "td/build"
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
}

package() {
  cd "td/build"
  mkdir -p ${pkgdir}/usr
  cmake --build . --target install
}
