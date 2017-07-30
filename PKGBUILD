# Maintainer: Radek Podgorny <radek@podgorny.cz>
# Contributor: Loïc Guitaut <flink at belfalas.eu>
# Contributor: Nicolas Doualot <packages at slubman.info>

pkgname='litecoin-qt'
pkgver=0.13.2
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.litecoin.org/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'protobuf')
license=('MIT')
pkgdesc="Peer-to-peer network based digital currency (QT)"
depends=(boost-libs qt5-base miniupnpc qrencode protobuf)
makedepends=(qt5-tools)
conflicts=(litecoin)
install=litecoin-qt.install
source=("https://github.com/litecoin-project/litecoin/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('b3cef44f3136fc1049c0be70fdb4562accad75b98096e76787bfcc48c91b745f'
            'cfc53dc9028745358235698ddd562d3e6b4a3ea9f896f5efc1aa8cd81f595559')

build() {
  cd "$srcdir/litecoin-$pkgver"
  ./autogen.sh
  ./configure --with-incompatible-bdb --with-gui=qt5
  make
}


package() {
  install -Dm644 litecoin-qt.desktop "$pkgdir"/usr/share/applications/litecoin.desktop
  cd "$srcdir/litecoin-$pkgver"
  install -Dm755 src/qt/litecoin-qt "$pkgdir"/usr/bin/litecoin-qt
  install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/litecoin128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

