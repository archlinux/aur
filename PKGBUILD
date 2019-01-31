pkgname=coin-or-vol
pkgver=1.5.3
pkgrel=1
pkgdesc="open-source implementation of a subgradient method that produces primal as well as dual solutions"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Vol"
license=('EPL')
groups=('coin-or')
depends=('coin-or-osi' 'coin-or-coinutils')
makedepends=()
source=("http://www.coin-or.org/download/source/Vol/Vol-$pkgver.tgz")
sha256sums=('8b015a01ec44957a30d920e91853984570438ec533d89085f02091a3c6286314')

build() {
  cd "$srcdir/Vol-$pkgver"
  COIN_SKIP_PROJECTS="Sample" \
  ./configure --prefix=/usr \
              --with-osi-lib="$(pkg-config --libs osi)" \
              --with-osi-incdir="/usr/include/coin/" \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/"
  make
}

package() {
  cd "$srcdir/Vol-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}

