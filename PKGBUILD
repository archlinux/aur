# Maintainer: Loïc Guitaut <flink at belfalas dot eu>

pkgname='litecoin-qt'
pkgver=0.8.7.5
pkgrel=2
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
sha256sums=('c1b04be2035c00f1af887c80c2d9c239acbb31ab581f734fe281741ace1c4539'
            'cfc53dc9028745358235698ddd562d3e6b4a3ea9f896f5efc1aa8cd81f595559')

build() {
  cd "$srcdir/litecoin-$pkgver"

  # and make qt gui
  qmake-qt4 USE_QRCODE=1 USE_UPNP=1 QMAKE_CXXFLAGS="-DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT=1"
  make
}


package() {
  install -Dm644 litecoin-qt.desktop "$pkgdir"/usr/share/applications/litecoin.desktop
  cd "$srcdir/litecoin-$pkgver"
  install -Dm755 litecoin-qt "$pkgdir"/usr/bin/litecoin-qt
  install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/litecoin128.png

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

