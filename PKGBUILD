# Maintainer: sputnick <gilles *dot* quenot *at* gmail>
# Contributor: Maurício CA <mauricio.antunes@gmail.com>
pkgname=xkbset
pkgver=0.5
pkgrel=3
pkgdesc="Program to help manage many of XKB features of X window."
arch=(i686 x86_64)
url="https://faculty.missouri.edu/~stephen/software/#xkbset"
license=('BSD')
groups=()
depends=('libx11')
optdepends=(perl-tk)
source=(http://faculty.missouri.edu/~stephen/software/xkbset/$pkgname-$pkgver.tar.gz)
sha256sums=('01c2579495b39e00d870f50225c441888dc88021e9ee3b693a842dd72554d172')

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
