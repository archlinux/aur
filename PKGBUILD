# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Loïc Guitaut <flink at belfalas dot eu>

pkgname='ppcoin-qt'
pkgver=0.5.4
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.ppcoin.org/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
pkgdesc="P2P Long-Term Energy-Efficient Crypto-Currency (QT)"
depends=(boost-libs qt4 miniupnpc qrencode)
install=ppcoin-qt.install
source=("http://downloads.sourceforge.net/project/ppcoin/$pkgver/ppcoin-${pkgver}ppc-linux.tar.gz"
        "$pkgname.desktop")
sha256sums=('1a15a190e95507b1686b5f4a32568e9b891cbed0e86ab711c489939d685e159a'
            'c770adf5f0dcb0394a3258014d38bb62d29e49ef9f284709d1578b8b45833df5')

build() {
  cd "$srcdir/ppcoin-${pkgver}ppc-linux/src"

  # and make qt gui
  qmake-qt4 USE_QRCODE=1 USE_UPNP=1
  make
}


package() {
  install -Dm644 ppcoin-qt.desktop "$pkgdir"/usr/share/applications/ppcoin.desktop
  cd "$srcdir/ppcoin-${pkgver}ppc-linux/src"
  install -Dm755 ppcoin-qt "$pkgdir"/usr/bin/ppcoin-qt
  install -Dm644 src/qt/res/icons/ppcoin.png "$pkgdir"/usr/share/pixmaps/ppcoin256.png

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

