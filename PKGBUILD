# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

pkgname=coin-or-vol
pkgver=1.5.0
pkgrel=1
pkgdesc="COIN-OR Volume Algorithm"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Vol"
license=('EPL')
groups=('coin-or')
depends=('coin-or-osi')
source=("http://www.coin-or.org/download/source/Vol/Vol-${pkgver}.tgz")
sha1sums=('e53dd21eb28fb5a60ed39492d054cceafeb39ddf')

build() {
  cd Vol-$pkgver/Vol
  COIN_SKIP_PROJECTS="Sample" \
  ./configure --prefix=/usr \
              --with-osi-lib="$(pkg-config --libs osi)" \
              --with-osi-incdir="/usr/include/coin/" \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/" \
              --enable-dependency-linking
  make
}

check() {
  cd Vol-$pkgver/Vol
  make test
}

package() {
  cd Vol-$pkgver/Vol
  PKG_CONFIG_LIBDIR="$pkgdir"/usr/lib/pkgconfig/ \
  make DESTDIR="$pkgdir" install
}
