# $Id$
# Maintainer: Biell <biell@pobox.com>

pkgname=vile
pkgver=9.8_x
_basever=${pkgver//_/}
pkgrel=1
pkgdesc="vi like emacs"
arch=('x86_64')
url="http://invisible-island.net/vile/vile.html"
depends=('ncurses')
license=('custom')
source=( https://invisible-island.net/archives/vile/current/vile-${_basever}.tgz )
sha1sums=( 236d8c76439cbf60f36c53bf40c6f27f227da044 )

prepare() {
  cd "$srcdir"/$pkgname-${_basever}
  #sed -i 's|FLEX_BETA|FLEX_NOBETA|g' filters/filters.h
}

build() {
  cd "$srcdir"/$pkgname-${_basever}
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-${_basever}
  mkdir -p "$pkgdir"/usr/lib/vile
  make install DESTDIR="$pkgdir"
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  cat <<EOF >"$pkgdir"/usr/share/licenses/$pkgname/license
Copyright

Vile is copyrighted by Paul G. Fox, Thomas E. Dickey and Kevin Buettner with some
files (e.g., visvile) copyright by Clark Morgan.
We distribute it under the terms of the GNU Public License, Version 2.
EOF
}
