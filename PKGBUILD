# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Paolo Herms

pkgname=why3
pkgver=0.86.3
_pkgvercode=35537 # IMPORTANT: update from gforge!
pkgrel=1
pkgdesc="The next generation of the software verification platform Why"
arch=(x86_64 i686)
url="http://why3.lri.fr/"
license=('LGPL')
depends=('gtksourceview2' 'sqlite')
makedepends=('ocaml' 'ocaml-sqlite3' 'lablgtk2' 'ocaml-menhir')
source=(https://gforge.inria.fr/frs/download.php/$_pkgvercode/$pkgname-$pkgver.tar.gz)
sha512sums=('f6df47c01094a9eda1a416ad1787a5f0601022f4889e6f557fca59bd3b59faa9887be3d33f051d10f21a2b5b43bc76c4f5a9f6d1904c07ecee7ceef836ec9b7a')

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
