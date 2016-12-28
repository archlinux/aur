pkgname=qtbitcointrader
pkgver=1.30.02
pkgrel=1
pkgdesc='Secure Multi Trading Client'
arch=(i686 x86_64)
url=https://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=(http://downloads.sourceforge.net/project/bitcointrader/SRC/QtBitcoinTrader-$pkgver.tar.gz)
sha256sums=(3b02c620c0738c67bedef3b5cc05d2ed4ca2b37fb787460f2498fc0d7b10bdb7)

build() {
  cd QtBitcoinTrader-$pkgver/src/

  qmake-qt5 QtBitcoinTrader_Linux.pro \
    QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"

  make
}

package() {
  cd QtBitcoinTrader-$pkgver/src/

  make INSTALL_ROOT=$pkgdir install

  install -d $pkgdir/usr/share/doc/QtBitcoinTrader/
  install -m644 LICENSE.GPL3 ../README.md $pkgdir/usr/share/doc/QtBitcoinTrader/
}
