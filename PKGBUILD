# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>
pkgname=coin-or-dylp
pkgver=1.10.0
pkgrel=1
pkgdesc="COIN-OR Linear programming solver using of the dynamic simplex algorithm"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/DyLP"
license=('EPL')
groups=('coin-or')
depends=('coin-or-osi')
source=("http://www.coin-or.org/download/source/DyLP/DyLP-${pkgver}.zip")
sha1sums=('7c27fb7735a64c92e68fba3e697ded07b91f95bb')

build() {
  cd DyLP-$pkgver
  COIN_SKIP_PROJECTS="Sample" \
  ./configure --prefix=/usr \
              --with-osi-lib="$(pkg-config --libs osi)" \
              --with-osi-incdir="/usr/include/coin/" \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/" -C
  make
}

check() {
  cd DyLP-$pkgver
  make test SAMPLE_DATA=`pkg-config --variable=datadir coindatasample`
}

package() {
  cd DyLP-$pkgver
  PKG_CONFIG_LIBDIR="$pkgdir"/usr/lib/pkgconfig/ \
  make DESTDIR="$pkgdir"/ install
}
