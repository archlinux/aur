pkgname=qtbitcointrader
pkgver=1.42.20
pkgrel=1
pkgdesc='Secure Multi Trading Client'
arch=(x86_64)
url=https://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=("https://downloads.sourceforge.net/bitcointrader/SRC/QtBitcoinTrader-$pkgver.tar.gz")
sha1sums=('cf3a2635f36eca3b589e4b639e314d49bf6cb399')

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
