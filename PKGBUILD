# Maintainer: Sebastien Duthil <duthils@free.fr>
pkgname=open-adventure
pkgver=1.2
pkgrel=3
pkgdesc="Port of the 'Colossal Cave Adventure' text-based adventure game"
arch=('i686' 'x86_64')
url="http://www.catb.org/~esr/open-adventure/"
license=('BSD')
makedepends=('python' 'python-yaml' 'asciidoc')
conflicts=('advent')
source=(${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/esr/open-adventure/repository/archive.tar.bz2?ref=${pkgver})
sha256sums=('a73fc979538e2a7ff20864c09519acbb5b88c5cd591603ad804f41950ac3118d')

build() {
  cd "$srcdir/$pkgname-$pkgver"-*

  make advent advent.6
}

check() {
  cd "$srcdir/$pkgname-$pkgver"-*

  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"-*

  install -Dm755 advent "$pkgdir/usr/bin/advent"
  install -Dm644 COPYING "$pkgdir/usr/share/licences/$pkgname/COPYING"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" NEWS hints.adoc history.adoc README.adoc notes.adoc
  install -Dm644 advent.6 "$pkgdir/usr/share/man/man6/advent.6"
}
