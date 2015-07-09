# Maintainer: Loïc Guitaut <flink at belfalas dot eu>

pkgname='litecoin-qt'
pkgver=0.10.2.2
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.litecoin.org/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
pkgdesc="Peer-to-peer network based digital currency (QT)"
depends=(boost-libs qt4 miniupnpc qrencode)
conflicts=(litecoin)
install=litecoin-qt.install
source=("https://github.com/litecoin-project/litecoin/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('952c84b181323db17a8fa23217f59b576ad3ebad92c158b3a7c29d458a1130dc'
            'cfc53dc9028745358235698ddd562d3e6b4a3ea9f896f5efc1aa8cd81f595559')

build() {
  cd "$srcdir/litecoin-$pkgver"
  ./autogen.sh
  ./configure --with-incompatible-bdb
  make
}


package() {
  install -Dm644 litecoin-qt.desktop "$pkgdir"/usr/share/applications/litecoin.desktop
  cd "$srcdir/litecoin-$pkgver"
  install -Dm755 src/qt/litecoin-qt "$pkgdir"/usr/bin/litecoin-qt
  install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/litecoin128.png

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

