pkgname=qtbitcointrader
pkgver=1.40.06
pkgrel=1
pkgdesc="Secure Trading Client for most popular Bitcoin exchanges"
arch=(i686 x86_64)
url=http://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=(https://downloads.sourceforge.net/project/bitcointrader/SRC/QtBitcoinTrader-$pkgver.tar.gz)
sha256sums=(d867bfd016871fa8ab90cffe708f1812ac234cfdb6ce4eb9af72545470b0e67e)

build() {
  cd QtBitcoinTrader-$pkgver/src/
  qmake-qt5 QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS -I/usr/include/openssl-1.0 $CXXFLAGS" \
            QMAKE_LFLAGS_RELEASE="$LDFLAGS -L/usr/lib/openssl-1.0"
  make
}

package() {
  cd QtBitcoinTrader-$pkgver/src/

  make INSTALL_ROOT=$pkgdir install

  mkdir -p $pkgdir/usr/share/doc/QtBitcoinTrader/
  cp LICENSE.GPL3 ../README.md $pkgdir/usr/share/doc/QtBitcoinTrader/
}
