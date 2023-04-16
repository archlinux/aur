pkgname=coin-or-vol
pkgver=1.5.4
pkgrel=1
pkgdesc="open-source implementation of a subgradient method that produces primal as well as dual solutions"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Vol"
license=('EPL')
groups=('coin-or')
depends=('coin-or-osi')
makedepends=()
source=("http://www.coin-or.org/download/source/Vol/Vol-$pkgver.tgz")
sha256sums=('dbcd822cb42c596990444c9db8b65e77ec71f98c8550e1212f9e8c1a7cba6930')

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

check() {
  cd "$srcdir/Vol-$pkgver"
  make test
}

package() {
  cd "$srcdir/Vol-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}

