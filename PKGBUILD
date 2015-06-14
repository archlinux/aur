# Maintainer: Alexander Merry <dev@randomguy3.me.uk>
pkgname=polyml
pkgver=5.5.2
pkgrel=1
epoch=
pkgdesc="A full implementation of Standard ML (SML)"
arch=('i686' 'x86_64')
url="http://www.polyml.org/"
license=('LGPL')
groups=()
options=('!libtool')
depends=('gmp' 'libffi')
install='polyml.install'
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname/$pkgver/$pkgname.$pkgver.tar.gz)
md5sums=('c935fd2d17749c1e127098215da990c9')

build() {
  cd "$srcdir/$pkgname.$pkgver"
  ./configure --prefix=/usr --without-x --with-system-libffi --with-gmp --enable-shared
  make
}

check() {
  cd "$srcdir/$pkgname.$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname.$pkgver"
  make DESTDIR="$pkgdir/" install

  # mesa-demos also installs a binary called "poly".
  # You can avoid the clash by uncommenting these lines,
  # but that may break other Poly/ML-based software you
  # wish to use.
  #mv "$pkgdir/usr/share/man/man1/poly.1" "$pkgdir/usr/share/man/man1/polyml.1"
  #sed -i 's|\<poly\>|polyml|g' "$pkgdir/usr/share/man/man1/polyml.1"
  #mv "$pkgdir/usr/bin/poly" "$pkgdir/usr/bin/polyml"
  #sed -i 's|${BINDIR}/poly |${BINDIR}/polyml |' "$pkgdir/usr/bin/polyc"
}

# vim:set ts=2 sw=2 et:
