# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=kreds-qt
pkgver=1.0.0
pkgrel=5
arch=('i686' 'x86_64')
url="https://www.kredsblockchain.com/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(kreds)
install=kreds-qt.install
source=("${pkgname%-git}::git+https://github.com/KredsBlockchain/kreds-core.git"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '6e25b4d68cf6df9684a554328c3a5cf2fbe9641203437b11901e128c17639369')

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 kreds-qt.desktop "$pkgdir"/usr/share/applications/kreds.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/kreds-qt "$pkgdir"/usr/bin/kreds-qt
  install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/kreds128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
