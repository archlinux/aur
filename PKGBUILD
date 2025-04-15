# Maintainer: Arnaud Berthomier <oz@cyprio.net>

_pkgname=telegram-tdlib
pkgname=${_pkgname}
pkgver=1.8.47
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
source=("git+https://github.com/tdlib/td.git#commit=a03a90470d6fca9a5a3db747ba3f3e4a465b5fe7")
sha256sums=('SKIP')

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
