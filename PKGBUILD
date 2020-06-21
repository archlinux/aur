pkgname=coin-or-alps
pkgver=2.0.1
pkgrel=1
pkgdesc="COIN-OR High-Performance Parallel Search Framework"
arch=('x86_64')
url="https://projects.coin-or.org/Alps"
license=('EPL')
groups=('coin-or')
depends=('coin-or-coinutils')
source=("https://github.com/coin-or/CHiPPS-ALPS/archive/releases/$pkgver.tar.gz")
sha256sums=('43f38b04699d4e70bde27f8dd024804e8a33ea7f521e5a5f121f373e2a60493a')

build() {
  cd "$srcdir/CHiPPS-ALPS-releases-$pkgver"
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
  cd "$srcdir/CHiPPS-ALPS-releases-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}

