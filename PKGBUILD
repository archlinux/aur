pkgname=qtbitcointrader
pkgver=1.40.09
pkgrel=1
pkgdesc="Secure Trading Client for most popular Bitcoin exchanges"
arch=(i686 x86_64)
url=http://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=(https://downloads.sourceforge.net/project/bitcointrader/SRC/QtBitcoinTrader-$pkgver.tar.gz)
sha256sums=(b40c1a58e92c22bfc1d3384c3162cdf0e60b1a93884c7fce45b57f0590fe245c)

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
  cp LICENSE.GPL3 $pkgdir/usr/share/doc/QtBitcoinTrader/
}
