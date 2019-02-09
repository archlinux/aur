# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=tuxcoin-qt
pkgver=2.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://tuxcoin.io/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(tuxcoin)
install=tuxcoin-qt.install
source=("${pkgname%-git}::git+https://github.com/bleach86/tuxcoin-V2.git#tag=v${pkgver}"
        "$pkgname.desktop")
sha256sums=('SKIP'
            'c195ecaffd62aba75adb7a653a85b10164f1a4d37f9dcf016b8c03d3516e1d42')

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  ./configure --with-gui=qt5 --disable-tests
  make
}

package() {
  install -Dm644 tuxcoin-qt.desktop "$pkgdir"/usr/share/applications/tuxcoin.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/tuxcoin-qt "$pkgdir"/usr/bin/tuxcoin-qt
  install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/tuxcoin128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
