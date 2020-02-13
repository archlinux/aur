# Maintainer: Daniel YC Lin <dlin.tw at gmail>
pkgname=coin-or-symphony
pkgver=5.6.17
pkgrel=2
pkgdesc="COIN-OR solver for mixed-integer linear programs(MILPs)"
arch=(i686 x86_64)
url="https://github.com/coin-or/SYMPHONY"
license=(EPL)
groups=(coin-or)
depends=(coin-or-cgl)
source=("https://github.com/coin-or/SYMPHONY/archive/releases/${pkgver}.tar.gz")

build() {
  cd SYMPHONY-releases-$pkgver/SYMPHONY
  COIN_SKIP_PROJECTS="Sample" \
  ./configure --prefix=/usr \
              --with-osi-lib="$(pkg-config --libs osi)" \
              --with-osi-incdir="/usr/include/coin/" \
              --with-clp-lib="$(pkg-config --libs clp)" \
              --with-clp-incdir="/usr/include/coin/" \
              --with-cgl-lib="$(pkg-config --libs cgl)" \
              --with-cgl-incdir="/usr/include/coin/" \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/" \
              --enable-dependency-linking \
              --enable-cbc-parallel
  make
}

check() {
  cd SYMPHONY-releases-$pkgver/SYMPHONY
#  make test
}

package() {
  cd SYMPHONY-releases-$pkgver/SYMPHONY
  PKG_CONFIG_LIBDIR="$pkgdir"/usr/lib/pkgconfig/ \
    make DESTDIR="$pkgdir" install
}
md5sums=('3461ca1fadb5519790efe0a06fe5da63')
