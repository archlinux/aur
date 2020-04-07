# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=coin-or-ipopt
pkgver=3.13.1
pkgrel=1
pkgdesc="Interior Point OPTimizer"
arch=('i686' 'x86_64')
url="https://github.com/coin-or/Ipopt"
license=('EPL')
groups=('coin-or')
depends=('lapack' 'coin-or-coinasl' 'coin-or-coinmumps')
source=("http://www.coin-or.org/download/source/Ipopt/Ipopt-$pkgver.tgz")
sha256sums=('64fc63a3fe27cf5efaf17ebee861f7db5bf70aacf9c316c0d37e4beb4eb72e11')

build() {
  cd "$srcdir"
  mkdir -p build && pushd build
  "$srcdir/Ipopt-releases-$pkgver/./configure" --prefix=/usr --without-hsl --disable-java
  make
}

check() {
  cd "$srcdir/build"
  make test
}

package() {
  cd "$srcdir/build"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir" install
  # for compatibility
  install -d "$pkgdir/usr/include/coin"
  install -m644 "$pkgdir"/usr/include/coin-or/* "$pkgdir"/usr/include/coin
}
