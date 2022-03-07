pkgname=qtbitcointrader
pkgver=1.41.00
pkgrel=1
pkgdesc='Secure Multi Trading Client'
arch=(x86_64)
url=https://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=("https://downloads.sourceforge.net/bitcointrader/SRC/QtBitcoinTrader-$pkgver.tar.gz")
sha1sums=('fb0502f8bfbd78508a5c8460ab5f5002c06b8fa9')

build() {
  cd QtBitcoinTrader-$pkgver/src
  qmake CONFIG+=nostrip \
        DEFINES+="${CPPFLAGS//-D/}" \
        QMAKE_CXXFLAGS-=-pipe \
        QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" \
        QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  make -C QtBitcoinTrader-$pkgver/src INSTALL_ROOT="$pkgdir" install
}
