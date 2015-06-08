pkgname=coin-or-alps
pkgver=1.5.1
pkgrel=1
pkgdesc="COIN-OR High-Performance Parallel Search Framework"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Alps"
license=('EPL')
groups=('coin-or')
depends=('coin-or-cgl' 'coin-or-clp')
source=("http://www.coin-or.org/download/pkgsource/CHiPPS/Alps-${pkgver}.tgz")
sha1sums=('99653744e3855b7d8b8a76b2f7814344bbb56b85')

build() {
  cd "$srcdir/Alps-$pkgver"
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
  cd "$srcdir/Alps-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}

