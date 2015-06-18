# Maintainer: sputnick <gilles *dot* quenot *at* gmail>
# Contributor: Maurício CA <mauricio.antunes@gmail.com>
pkgname=xkbset
pkgver=0.5
pkgrel=2
pkgdesc="Program to help manage many of XKB features of X window."
arch=(i686 x86_64)
url="http://www.math.missouri.edu/~stephen/software/#xkbset"
license=('custom:BSD')
groups=()
depends=(libx11)
makedepends=(coreutils)
optdepends=(perl-tk)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.math.missouri.edu/~stephen/software/xkbset/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('282c416a76a237fa84a7b513c9d7b2cf')

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
}

# vim:set ts=2 sw=2 et:
