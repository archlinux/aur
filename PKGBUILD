pkgname=coin-or-bcps
pkgver=0.94.0
pkgrel=1
pkgdesc="Part of the COIN High Performance Parallel Search Framework"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/CHiPPS"
license=('EPL')
groups=('coin-or')
depends=('coin-or-alps')
source=("http://www.coin-or.org/download/pkgsource/CHiPPS/Bcps-${pkgver}.tgz")
sha1sums=('987834b7fa53eb2e8badf5429dabf71cec7225a6')

build() {
  cd "$srcdir/Bcps-$pkgver"
  COIN_SKIP_PROJECTS="Sample" \
  ./configure --prefix=/usr \
              --with-alps-lib="$(pkg-config --libs alps)" \
              --with-alps-incdir="/usr/include/coin/" \
              --with-osi-lib="$(pkg-config --libs osi)" \
              --with-osi-incdir="/usr/include/coin/" \
              --with-clp-lib="$(pkg-config --libs clp)" \
              --with-clp-incdir="/usr/include/coin/" \
              --with-cgl-lib="$(pkg-config --libs cgl)" \
              --with-cgl-incdir="/usr/include/coin/" \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/" -C
  make
}

package() {
  cd "$srcdir/Bcps-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}

