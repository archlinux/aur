# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=fastjet-contrib
pkgver=1.052
pkgrel=1
pkgdesc="3rd party extensions of FastJet."
arch=('x86_64')
url="http://fastjet.fr/"
license=('GPL2')
depends=(bash fastjet)
source=(http://fastjet.hepforge.org/contrib/downloads/fjcontrib-$pkgver.tar.gz)
md5sums=('9427a0b20151db828306547c8bfb1653')

build() {
  cd "$srcdir/fjcontrib-$pkgver"
  ./configure --prefix=$pkgdir/usr
  make
  make fragile-shared
}

package() {
  cd "$srcdir/fjcontrib-$pkgver"
  make install
  rm $pkgdir/usr/lib/*.a
  install -D -m644 "$srcdir/fjcontrib-$pkgver/libfastjetcontribfragile.so" "${pkgdir}/usr/lib/"
}
