# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=seci-coin-qt
pkgver=1.15.1.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://seci.io/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(seci-coin)
install=seci-coin-qt.install
source=("${pkgname%-git}::git+https://github.com/Seci-Coin/Seci.git#tag=${pkgver}"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '11458f169fb1a43c20b998fa3cfce49519721e8cfe0b1d4976870326a594e8cf')

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  chmod +x ./configure
  ./configure --with-gui=qt5 --disable-tests
  make
}


package() {
  install -Dm644 seci-coin-qt.desktop "$pkgdir"/usr/share/applications/seci-coin.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/seci-qt "$pkgdir"/usr/bin/seci-coin-qt
  install -Dm644 share/pixmaps/seci128.png "$pkgdir"/usr/share/pixmaps/seci-coin128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
