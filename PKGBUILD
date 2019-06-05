_name=wisp
pkgname=guile-$_name-hg
pkgver=r1628+.62d6a170aefd+
pkgrel=1
pkgdesc="Whitespace to Lisp converter (srfi-119) as a guile module"
arch=(any)
license=(gpl3+)
makedepends=(mercurial)
depends=("guile>=2")
provides=("$_name")
source=("hg+https://bitbucket.org/ArneBab/wisp"
        "fix-build-path.patch")
url="http://www.draketo.de/english/wisp"
md5sums=(SKIP
         SKIP)

pkgver() {
  cd "$srcdir/$_name" &&
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$srcdir/$_name"
  patch -i "${srcdir}/fix-build-path.patch"
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
