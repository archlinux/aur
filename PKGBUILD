# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=vislcg3
pkgver=1.0.0~r12200
pkgrel=1
pkgdesc="Compiler and parser for Constraint Grammar (CG), a paradigm for robust, rule-based Natural Language Parsing."
url="http://beta.visl.sdu.dk/cg3.html"
license=('GPL3')
makedepends=('boost' 'gperftools' 'cmake')
depends=('icu')
optdepends=('perl: cg3-autobin.pl auto-compile-and-run wrapper')
options=('!libtool')
arch=('i686' 'x86_64')
source=("http://beta.visl.sdu.dk/download/vislcg3/cg3-1.0.0~r12200.tar.bz2")
md5sums=('c71b7bbd86dc0450ac54dee926ff4561')
sha256sums=('a183db488b2a0252bff1dceab79753aab14ccfcae4349cc71fb6b13320e1c604')
install='vislcg3.install'

package () {
  cd "$srcdir/cg3"
  make DESTDIR="$pkgdir/" install
}

build() {
  cd "$srcdir/cg3"
  ./get-boost.sh
  # https://svn.boost.org/trac/boost/ticket/11145
  ( cd ../.. && patch -p0 < icu_boost.diff )
  ./cmake.sh -D CMAKE_INSTALL_PREFIX=/usr && make
}
