pkgname=coin-or-alps
pkgver=1.5.6
pkgrel=1
pkgdesc="COIN-OR High-Performance Parallel Search Framework"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Alps"
license=('EPL')
groups=('coin-or')
depends=('coin-or-cgl' 'coin-or-clp')
source=("https://www.coin-or.org/download/source/Alps/CHiPPS-Alps-${pkgver}.tgz")
sha1sums=('88b359d8bc998d0940728961f4eeb608eabc775c')

build() {
  cd "$srcdir/CHiPPS-Alps-$pkgver"
  COIN_SKIP_PROJECTS="Sample" \
  ./configure --prefix=/usr \
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
  cd "$srcdir/CHiPPS-Alps-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}

