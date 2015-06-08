pkgname=coin-or-blis
pkgver=0.93.11
pkgrel=1
pkgdesc="BLIS (BiCePS Linear Integer Solver)"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/CHiPPS"
license=('EPL')
groups=('coin-or')
depends=('coin-or-bcps')
source=("http://www.coin-or.org/download/pkgsource/CHiPPS/Blis-${pkgver}.tgz")
sha1sums=('2ba385b5d3706d55f36e7a12f7e22a0fbbd6210d')

build() {
  cd "$srcdir/Blis-$pkgver"
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

check() {
  cd "$srcdir/Blis-$pkgver"
  make test
}

package() {
  cd "$srcdir/Blis-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}

