_name=wisp
pkgname=guile-$_name-hg
pkgver=r1374.2a8cd5e0a13c
pkgrel=1
pkgdesc="wisp (srfi-119) as a language for guile"
arch=(any)
license=(gpl3+)
makedepends=(mercurial)
depends=(guile)
provides=("$_name")
source=("hg+http://draketo.de/proj/$_name")
url="http://www.draketo.de/english/wisp"
md5sums=(SKIP)
install="$pkgname.install"

pkgver() {
  cd "$srcdir/$_name" &&
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "$srcdir/$_name" &&
  autoreconf -i &&
  ./configure --datarootdir=/usr/share &&
  make &&
  make install DESTDIR="$pkgdir"
}