# Maintainer: sputnick <gilles *dot* quenot *at* gmail>
# Contributor: Maurício CA <mauricio.antunes@gmail.com>
pkgname=xkbset
pkgver=0.6
pkgrel=1
pkgdesc="Program to help manage many of XKB features of X window."
arch=(i686 x86_64)
url="https://www.math.missouri.edu/~stephen/software/#xkbset"
license=('custom:BSD')
groups=()
depends=('libx11')
optdepends=(perl-tk)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=( "https://faculty.missouri.edu/~stephen/software/xkbset/$pkgname-$pkgver.tar.gz" )
noextract=()
md5sums=('ac032fec49c4c4f0f2318d3f4618970c514191b142e06c51a661fe2342a535a5')

build() {
  sed -r \
      -e 's|^(X11PREFIX=/usr).*|\1|' \
      -e 's|^(X11BASE=/usr).*|\1|' \
      -e 's|^INC_PATH=.*|&/X11|' \
      -e 's|^(INSTALL_MAN1=.*)(/.*/.*)|\1/share\2|' \
      -i "$srcdir/$pkgname-$pkgver/Makefile"
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}

# vim:set ts=2 sw=2 et:
