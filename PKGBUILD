# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Loïc Guitaut <flink at belfalas dot eu>

pkgname='terracoin-qt'
pkgver=0.12.2.5
pkgrel=1
arch=('i686' 'x86_64')
url="https://www.terracoin.io"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
pkgdesc="P2P decentralized digital currency with fast confirmation and no central issuer (QT)"
depends=(boost-libs qt5-base miniupnpc qrencode)
install=terracoin-qt.install
source=("https://github.com/terracoin/terracoin/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('94fc2db45a43d56fb3ebb383eff641b550808e80c24be79811ee44e59c8a83b3'
            '71f94ea8725bf59e3758b8d246762f7f5b61373c15370e13d54f7d174785456b')

build() {
  cd "$srcdir/terracoin-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}


package() {
  install -Dm644 terracoin-qt.desktop "$pkgdir"/usr/share/applications/terracoin.desktop
  cd "$srcdir/terracoin-$pkgver"
  install -Dm755 terracoin-qt "$pkgdir"/usr/bin/terracoin-qt
  install -Dm644 src/qt/res/icons/bitcoin.png "$pkgdir"/usr/share/pixmaps/terracoin256.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

