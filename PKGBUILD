# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=coin-or-osi-git
pkgver=0.107.4
pkgrel=1
pkgdesc="COIN-OR Open Solver Interface"
arch=(i686 x86_64 arm)
url="https://projects.coin-or.org/Osi"
license=(EPL)
groups=(coin-or)
depends=(coin-or-coinutils glpk scipoptsuite lazylpsolverlibs-git)
makedepends=(gcc-fortran)
source=("http://www.coin-or.org/download/source/Osi/Osi-${pkgver}.tgz")
sha1sums=('c1496835a98791a86eabadd8aead96719690d701')

build() {
    cd Osi-$pkgver
    COIN_SKIP_PROJECTS="Sample" \
    ./configure --prefix=/usr --enable-dependency-linking \
                --with-coinutils-incdir="/usr/include/coin/" \
                --with-coinutils-lib="$(pkg-config --libs coinutils)" \
                --with-cplex-incdir="$(pkg-config --variable=includedir lazycplex)/lazylpsolverlibs/ilcplex" \
                --with-cplex-lib="$(pkg-config --libs lazycplex)" \
                --with-gurobi-incdir="$(pkg-config --variable=includedir lazygurobi)/lazylpsolverlibs" \
                --with-gurobi-lib="$(pkg-config --libs lazygurobi)" \
                --with-xpress-incdir="$(pkg-config --variable=includedir lazyxprs)/lazylpsolverlibs" \
                --with-xpress-lib="$(pkg-config --libs lazyxprs)"
    make
}

package() {
    cd Osi-$pkgver
    PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
    make DESTDIR="$pkgdir" install
}
