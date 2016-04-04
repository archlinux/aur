# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=gpsfish_minimal
pkgver=20150706
pkgrel=2
pkgdesc="A shogi program ported from Stockfish, the compact version."
makedepends=('unzip')
conflicts=('gpsfish')
arch=(i686 x86_64)
url="http://gps.tanaka.ecc.u-tokyo.ac.jp/gpsshogi/pukiwiki.php?GPSFish"
license=('GPLv3')
source=("http://gps.tanaka.ecc.u-tokyo.ac.jp/gpsshogi/download/gpsfish-20150705.1.1-win64.source.zip")
md5sums=('f2133026142da7b185067c580f6bda24')

prepare() {
    cd $srcdir/src
    sed -ie 's!`pwd`!/usr/share/gpsfish_minimal!g' Makefile
}

build() {
    cd $srcdir/src
	GPSFISH_HOME=/usr/share/$pkgname make
}

package() {
    cd $srcdir
    mkdir -m755 -p $pkgdir/usr/share/$pkgname
    install -TDm644 data/eval.bin $pkgdir/usr/share/$pkgname/data/eval.bin
    install -m644 ./src/*.txt $pkgdir/usr/share/$pkgname/
    install -TDm755 ./src/gpsfish $pkgdir/usr/bin/gpsfish
}
