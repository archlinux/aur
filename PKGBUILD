pkgname=coin-or-bonmin
pkgver=1.8.6
pkgrel=1
pkgdesc="Experimental open-source C++ code for solving general MINLP problems"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Bonmin"
license=('EPL')
groups=('coin-or')
depends=('coin-or-cbc' 'coin-or-ipopt' )
makedepends=()
source=("https://www.coin-or.org/download/source/Bonmin/Bonmin-$pkgver.tgz")
sha256sums=('7aa132403cd2a15f55f779df51e1f14a7272ed8de22ece0c40403b23819c2b71')

build() {
  cd "$srcdir/Bonmin-$pkgver"
  COIN_SKIP_PROJECTS="Sample" \
  ./configure --prefix=/usr \
              --with-osi-lib="$(pkg-config --libs osi)" \
              --with-osi-incdir="/usr/include/coin/" \
              --with-clp-lib="$(pkg-config --libs clp)" \
              --with-clp-incdir="/usr/include/coin/" \
              --with-cgl-lib="$(pkg-config --libs cgl)" \
              --with-cgl-incdir="/usr/include/coin/" \
              --with-vol-lib="$(pkg-config --libs vol)" \
              --with-vol-incdir="/usr/include/coin/" \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/" \
              --with-bcp-lib="$(pkg-config --libs bcp)" \
              --with-bcp-incdir="/usr/include/coin/" \
              --with-cbc-lib="$(pkg-config --libs cbc)" \
              --with-cbc-incdir="/usr/include/coin/" \
              --with-ipopt-lib="$(pkg-config --libs ipopt)" \
              --with-ipopt-incdir="/usr/include/coin/"
  make
}

package() {
  cd "$srcdir/Bonmin-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}

