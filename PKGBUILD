# Maintainer: Arnaud Berthomier <oz@cyprio.net>

_pkgname=telegram-tdlib
pkgname=${_pkgname}
pkgver=1.8.55
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
source=("git+https://github.com/tdlib/td.git#commit=7d257dcda5dd2c616c1146540ef51147c5bb2c69")
sha256sums=('4475a143a7220a5c6cc3040da0bdbc9e8dc226e72d68e075a45432b0d9d31c98')

build() {
  mkdir -p "td/build"
  cd "td/build"
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
}

package() {
  cd "td/build"
  mkdir -p ${pkgdir}/usr
  DESTDIR="${pkgdir}" cmake --build . --target install
}
