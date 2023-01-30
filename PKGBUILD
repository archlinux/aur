pkgname=coin-or-bonmin
pkgver=1.8.9
pkgrel=1
pkgdesc="Experimental open-source C++ code for solving general MINLP problems"
arch=('x86_64')
url="https://projects.coin-or.org/Bonmin"
license=('EPL')
groups=('coin-or')
depends=('coin-or-cbc' 'coin-or-ipopt' 'coin-or-bcp')
makedepends=('nauty')
source=("https://github.com/coin-or/Bonmin/archive/refs/tags/releases/${pkgver}.tar.gz")
sha256sums=('739f1fe74a81003c74ade425733417f6bcf4003941d7fa1ee989b46430c8b63a')

prepare() {
  cd "$srcdir/Bonmin-releases-$pkgver"
}

build() {
  cd "$srcdir/Bonmin-releases-$pkgver"
  CXXFLAGS="${CXXFLAGS} -I/usr/include/coin" \
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
  cd "$srcdir/Bonmin-releases-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}

