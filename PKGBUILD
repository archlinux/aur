# Maintainer: Loïc Guitaut <flink at belfalas dot eu>

pkgname='terracoin-qt'
pkgver=0.8.0.4
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.terracoin.org/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
pkgdesc="P2P decentralized digital currency with fast confirmation and no central issuer (QT)"
depends=(boost-libs qt4 miniupnpc qrencode)
install=terracoin-qt.install
source=("https://github.com/terracoin/terracoin/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('59d0a1925939add4bc70054541a7f032c8c566e73c2ec1a4da9c48a079bd0438'
            '71f94ea8725bf59e3758b8d246762f7f5b61373c15370e13d54f7d174785456b')

build() {
  cd "$srcdir/terracoin-$pkgver"
  qmake-qt4 USE_QRCODE=1 USE_UPNP=1
  make
}


package() {
  install -Dm644 terracoin-qt.desktop "$pkgdir"/usr/share/applications/terracoin.desktop
  cd "$srcdir/terracoin-$pkgver"
  install -Dm755 terracoin-qt "$pkgdir"/usr/bin/terracoin-qt
  install -Dm644 src/qt/res/icons/bitcoin.png "$pkgdir"/usr/share/pixmaps/terracoin256.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

