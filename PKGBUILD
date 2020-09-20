_name=wisp
pkgname=guile-$_name-hg
pkgver=r1710.ad2b1867648a
pkgrel=1
pkgdesc="Whitespace to Lisp converter (srfi-119) as a guile module"
arch=(any)
license=(gpl3+)
makedepends=(mercurial)
depends=("guile>=2")
provides=("$_name")
source=("hg+https://hg.sr.ht/~arnebab/wisp")
url="http://www.draketo.de/english/wisp"
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$_name" &&
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$srcdir/$_name"
}

build() {
  cd "$srcdir/$_name"
  autoreconf -i
  ./configure --datarootdir=/usr/share
  make
}

package() {
  cd "$srcdir/$_name"
  make install DESTDIR="$pkgdir"
}
