# Maintainer: farseerfc <farseerfc@gmail.com>
# Contributor: nylocx <just18@gmx.de>
# Contributor: Llumex03 <l.lumex03@gmail.com>
# Original uploader in CCR: FranzMari
# Original uploader in AUR: á¸¶á¸·umex03
# Fixes in AUR by: ogarcia

pkgname=libqtelegram-ae
_pkgname=libqtelegram-aseman-edition
epoch=3
pkgver=6.1
_pkgver=$pkgver-stable
pkgrel=6
pkgdesc="Telegram library written in Qt based on telegram-cli code"
arch=('x86_64')
license=('GPL3')
url="https://launchpad.net/libqtelegram"
depends=('qt5-base' 'qt5-multimedia' 'openssl-1.0')
makedepends=('cmake')
source=("${_pkgname}-${_pkgver}.tar.gz::https://github.com/Aseman-Land/libqtelegram-aseman-edition/archive/v$_pkgver.tar.gz")
sha256sums=('ffc1f85a7b0cdd16149c89722f33c43de9fa3db15271d0ff26734ba35e0a02c0')

prepare() {
  cd $_pkgname-$_pkgver
  mkdir -p build
}

build() {
  cd $_pkgname-$_pkgver/build
  qmake-qt5 -r .. PREFIX=/usr INSTALL_LIBS_PREFIX=/usr/lib INSTALL_HEADERS_PREFIX=/usr/include OPENSSL_INCLUDE_PATH=/usr/include/openssl-1.0 OPENSSL_LIB_DIR=/usr/lib/openssl-1.0 QMAKE_CFLAGS_ISYSTEM=
  make
}

package() {
  cd $_pkgname-$_pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
