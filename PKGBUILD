# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Paolo Herms

pkgname=why3
pkgver=0.85
_pkgvercode=34074 # IMPORTANT: update from gforge!
pkgrel=1
pkgdesc="The next generation of the former software verification platform Why"
arch=(x86_64 i686)
url="http://why3.gforge.inria.fr/"
license=('GPL')
depends=('gtksourceview2' 'sqlite3')
makedepends=('ocaml' 'ocaml-sqlite3' 'lablgtk2')
source=(https://gforge.inria.fr/frs/download.php/$_pkgvercode/$pkgname-$pkgver.tar.gz)
md5sums=('f6d36c0dc43fe75af148d92d76b15937')


build() {
    cd "$srcdir"/$pkgname-$pkgver
    ./configure --prefix=/usr --disable-pvs-libs
    make clean
    make all # src/why3.cma
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    make DESTDIR="$pkgdir" OCAMLLIB="$pkgdir"/usr/lib/ocaml install install-lib
}
