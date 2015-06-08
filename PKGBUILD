pkgname=coin-or-bcp
pkgver=1.4.0
pkgrel=1
pkgdesc="COIN-OR parallel branch-cut-price algorithms for mixed-integer linear programs"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Bcp"
license=('EPL')
groups=('coin-or')
depends=('coin-or-cgl' 'coin-or-clp')
source=("http://www.coin-or.org/download/source/Bcp/Bcp-${pkgver}.tgz")
sha1sums=('addf63bda07f85ea6a6b16ff32088afd08a3b56e')

build() {
  cd "$srcdir/Bcp-$pkgver"
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
              --with-coinutils-incdir="/usr/include/coin/" -C
  make
}

check() {
  cd "$srcdir/Bcp-$pkgver"
  make test
}

package() {
  cd "$srcdir/Bcp-$pkgver/Bcp"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}
