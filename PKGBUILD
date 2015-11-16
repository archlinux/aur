# Maintainer: Loïc Guitaut <flink at belfalas.eu>
# Contributor: Nicolas Doualot <packages at slubman.info>

pkgname='litecoin-qt'
pkgver=0.10.2.2
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.litecoin.org/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'protobuf')
license=('MIT')
pkgdesc="Peer-to-peer network based digital currency (QT)"
depends=(boost-libs qt4 miniupnpc qrencode protobuf)
conflicts=(litecoin)
install=litecoin-qt.install
source=("https://github.com/litecoin-project/litecoin/archive/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "upnp-1.9.patch")
sha256sums=('952c84b181323db17a8fa23217f59b576ad3ebad92c158b3a7c29d458a1130dc'
            'cfc53dc9028745358235698ddd562d3e6b4a3ea9f896f5efc1aa8cd81f595559'
            '3060917f8e327002da842534265392a1849239ec5049f25c1ae8a81c3952e7b1')

build() {
  cd "$srcdir/litecoin-$pkgver"
  patch -p1 -i ../upnp-1.9.patch
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

