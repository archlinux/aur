pkgname=qtbitcointrader
pkgver=1.40.09
pkgrel=2
pkgdesc="Secure Trading Client for most popular Bitcoin exchanges"
arch=(x86_64)
url=https://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=(
QtBitcoinTrader-$pkgver.tar.gz::https://codeload.github.com/JulyIGHOR/QtBitcoinTrader/tar.gz/cd71ad9
)
sha256sums=(461a36f19dbea42aa6b9550bd88361af30b70590461a43f12312e40e9ba0e349)

prepare() {
  sed -i 1,4d QtBitcoinTrader-*/src/QtBitcoinTrader_Desktop.pro
}

build() {
  cd QtBitcoinTrader-*/src/
  qmake-qt5 QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  make -C QtBitcoinTrader-*/src/ INSTALL_ROOT=$pkgdir install
}
