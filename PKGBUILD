# $Id$
# Maintainer: Biell <biell@pobox.com>

pkgname=vile
pkgver=9.8_t
_basever=${pkgver//_/}
pkgrel=1
pkgdesc="vi like emacs"
arch=('x86_64')
url="http://invisible-island.net/vile/vile.html"
depends=('ncurses')
license=('custom')
source=( ftp://ftp.invisible-island.net/vile/current/vile-${_basever}.tgz )
sha1sums=( 9e181852cdc3ff72756ace4873bcf3eddd071cf5 )

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
