# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=fastjet-contrib
pkgver=1.046
pkgrel=1
pkgdesc="3rd party extensions of FastJet."
arch=('x86_64')
url="http://fastjet.fr/"
license=('GPL2')
depends=(bash fastjet)
source=(http://fastjet.hepforge.org/contrib/downloads/fjcontrib-$pkgver.tar.gz)
md5sums=('4002bf04d402b3e828f9a3011f5fff5c')

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
