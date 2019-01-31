pkgname=coin-or-bcp
pkgver=1.4.3
pkgrel=1
pkgdesc="Parallel framework for implementing branch, cut, and price algorithms for solving mixed integer programs"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Bcp"
license=('EPL')
groups=('coin-or')
depends=('coin-or-vol')
makedepends=()
source=("http://www.coin-or.org/download/source/Bcp/Bcp-$pkgver.tgz")
sha256sums=('5e7a2871033f9d5e8dda69b5fc19ff37853f24f4bdd42fb0b97f904e3a7c856e')

build() {
  cd "$srcdir/Bcp-$pkgver"
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
              --with-coinutils-incdir="/usr/include/coin/"
  make
}

package() {
  cd "$srcdir/Bcp-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir" install
}

