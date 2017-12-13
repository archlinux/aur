pkgname=qtbitcointrader
pkgver=1.40.09
pkgrel=2
pkgdesc="Secure Trading Client for most popular Bitcoin exchanges"
arch=(x86_64)
url=https://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=(https://downloads.sourceforge.net/project/bitcointrader/SRC/QtBitcoinTrader-$pkgver.tar.gz
        https://raw.githubusercontent.com/JulyIGHOR/QtBitcoinTrader/master/src/julyaes256.cpp)
sha256sums=(b40c1a58e92c22bfc1d3384c3162cdf0e60b1a93884c7fce45b57f0590fe245c
            7fb8d145dadd3b75552d93830cb73b6f6027d04285a5c884e26895b66503135f)

prepare() {
  sed -i 1,4d QtBitcoinTrader-$pkgver/src/QtBitcoinTrader_Desktop.pro
  cp julyaes256.cpp QtBitcoinTrader-$pkgver/src/
}

build() {
  cd QtBitcoinTrader-$pkgver/src/
  qmake-qt5 QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  make -C QtBitcoinTrader-$pkgver/src/ INSTALL_ROOT=$pkgdir install
}
