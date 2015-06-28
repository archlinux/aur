# Maintainer: Loïc Guitaut <flink at belfalas dot eu>

pkgname='ppcoin-qt'
pkgver=0.4.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.ppcoin.org/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
pkgdesc="P2P Long-Term Energy-Efficient Crypto-Currency (QT)"
depends=(boost-libs qt4 miniupnpc qrencode)
install=ppcoin-qt.install
source=("http://downloads.sourceforge.net/project/ppcoin/0.4.0/ppcoin-0.4.0-linux.tar.gz"
        "$pkgname.desktop")
sha256sums=('561076e8d4e82085d577eb717b9f8b52571556fea2b8181fa8eb6039218d3f06'
            'c770adf5f0dcb0394a3258014d38bb62d29e49ef9f284709d1578b8b45833df5')

build() {
  cd "$srcdir/ppcoin-$pkgver-linux/src"

  # and make qt gui
  qmake-qt4 USE_QRCODE=1 USE_UPNP=1
  make
}


package() {
  install -Dm644 ppcoin-qt.desktop "$pkgdir"/usr/share/applications/ppcoin.desktop
  cd "$srcdir/ppcoin-$pkgver-linux/src"
  install -Dm755 ppcoin-qt "$pkgdir"/usr/bin/ppcoin-qt
  install -Dm644 src/qt/res/icons/ppcoin.png "$pkgdir"/usr/share/pixmaps/ppcoin256.png

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

