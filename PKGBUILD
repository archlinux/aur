pkgname=qtbitcointrader
pkgver=1.42.00
pkgrel=1
pkgdesc='Secure Multi Trading Client'
arch=(x86_64)
url=https://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=("https://downloads.sourceforge.net/bitcointrader/SRC/QtBitcoinTrader-$pkgver.tar.gz")
sha1sums=('ac8674db9be9a89fccb282507ab2c6647e6f4e82')

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
