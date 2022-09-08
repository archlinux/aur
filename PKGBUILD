# Maintainer: ramen <hendrikschick@hndrkk.sh>
# Contributor: sputnick <gilles *dot* quenot *at* gmail>
# Contributor: Maurício CA <mauricio.antunes@gmail.com>
pkgname=xkbset
pkgver=0.8
pkgrel=4
pkgdesc="Manage most of the options of XKB extensions from X window interface."
arch=(i686 x86_64)
url="https://github.com/stephenmontgomerysmith/xkbset"
license=('custom:BSD')
depends=('libx11')
makedepends=('git')
optdepends=('perl-tk: to use the xkbset-gui program')
provides=('xkbset')
conflicts=('xkbset-git')
source=( "https://github.com/stephenmontgomerysmith/xkbset/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('23c2397f16473611ca16eddbb5b144da1f02b2765183b8b4f99e17031488ea6a')

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
