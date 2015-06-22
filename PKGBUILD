# Maintainer: farseerfc <farseerfc@gmail.com> 
# Contributor: nylocx <just18@gmx.de>
# Contributor: Llumex03 <l.lumex03@gmail.com>
# Original uploader in CCR: FranzMari 
# Original uploader in AUR: á¸¶á¸·umex03
# Fixes in AUR by: ogarcia

pkgname=libqtelegram-ae
_pkgname=libqtelegram-aseman-edition
epoch=1
pkgver=4.1
pkgrel=1
pkgdesc="Telegram library written in Qt based on telegram-cli code"
arch=('x86_64' 'i686')
license=('GPL3')
url=("https://launchpad.net/libqtelegram")
depends=('qt5-base' 'qt5-multimedia')
makedepends=('cmake')
source=("https://github.com/Aseman-Land/libqtelegram-aseman-edition/archive/v$pkgver.tar.gz")
sha256sums=('7cebd68d3c95b46b23933becc3d3e592a9101fbf1211dd807f59947f59b4b0d9')

prepare() {
  cd $_pkgname-$pkgver
  sed -i 's#target.path = $$PREFIX/lib/$$LIB_PATH#target.path = $$PREFIX/lib#' libqtelegram-ae.pro
  mkdir -p build
}

build() {
  cd $_pkgname-$pkgver/build
  qmake-qt5 -r .. PREFIX=/usr
  make
}

package() {
  cd $_pkgname-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
