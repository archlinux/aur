# Maintainer: Arnaud Berthomier <oz-cypr-dot-io>

_pkgname=telegram-tdlib
pkgname=${_pkgname}
pkgver=1.5.0
pkgrel=1
pkgdesc='Cross-platform library for building Telegram clients'
arch=('i686' 'x86_64')
url='https://core.telegram.org/tdlib'
license=('Boost')
depends=('openssl' 'zlib')
makedepends=('make' 'gcc' 'cmake' 'gperf')
provides=('telegram-tdlib')
conflicts=('telegram-tdlib')
source=("https://github.com/tdlib/td/archive/v$pkgver.tar.gz")
sha256sums=('ecd30f0261eebbdaa68741bc7e2120fa492c129cb62e2773ab95cc2a789db60e')

build() {
  cd "${srcdir}/td-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
}

package() {
  cd "${srcdir}/td-$pkgver/build"
  mkdir -p ${pkgdir}/usr
  cmake --build . --target install
}
