# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=btcmonster-qt
pkgver=1.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://bitcoinmonster.org/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(btcmonster)
install=btcmonster-qt.install
source=("${pkgname%-git}::git+http://github.com/Bitcoin-Monster/BTCMonster.git"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '9b6a422f000b3f8963e64317c06deb4d704b375b4a13b8e8c67f3d88503dd744')

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 btcmonster-qt.desktop "$pkgdir"/usr/share/applications/btcmonster.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/bitcoinmonster-qt "$pkgdir"/usr/bin/btcmonster-qt
  install -Dm644 share/pixmaps/bitcoinmonster128.png "$pkgdir"/usr/share/pixmaps/bitcoinmonster128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
