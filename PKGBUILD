_name=wisp
pkgname=guile-$_name-hg
pkgver=r1623.9b0863aad000
pkgrel=1
pkgdesc="wisp is a whitespace to lisp converter (srfi-119). guile module"
arch=(any)
license=(gpl3+)
makedepends=(mercurial)
depends=("guile>=2")
provides=("$_name")
source=("hg+https://bitbucket.org/ArneBab/wisp#branch=stable")
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