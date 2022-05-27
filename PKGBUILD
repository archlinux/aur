# Maintainer: Arnaud Berthomier <oz-cypr-dot-io>

_pkgname=telegram-tdlib
pkgname=${_pkgname}
pkgver=1.8.0
pkgrel=3
pkgdesc='Cross-platform library for building Telegram clients'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://core.telegram.org/tdlib'
license=('Boost')
depends=('openssl' 'zlib')
makedepends=('make' 'gcc' 'cmake' 'gperf' 'git')
provides=('telegram-tdlib')
conflicts=('telegram-tdlib')
options=('!lto')
source=("https://github.com/tdlib/td/archive/v$pkgver.tar.gz")
sha256sums=('30d560205fe82fb811cd57a8fcbc7ac853a5b6195e9cb9e6ff142f5e2d8be217')

build() {
  mkdir -p "td-$pkgver/build"
  cd "td-$pkgver/build"
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
}

package() {
  cd "td-$pkgver/build"
  mkdir -p ${pkgdir}/usr
  cmake --build . --target install
}
