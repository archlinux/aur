# Maintainer: Sebastien Duthil <duthils@free.fr>
pkgname=open-adventure
pkgver=1.2
pkgrel=1
pkgdesc="Port of the 'Colossal Cave Adventure' text-based adventure game"
arch=('i686' 'x86_64')
url="http://www.catb.org/~esr/open-adventure/"
license=('BSD')
makedepends=('python' 'python-yaml')
conflicts=('advent')
source=(${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/esr/open-adventure/repository/archive.tar.bz2?ref=1.2)
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

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/licences/$pkgname"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -d "$pkgdir/usr/share/man/man6"
  install -m755 advent "$pkgdir/usr/bin"
  install -m644 COPYING "$pkgdir/usr/share/licences/$pkgname"
  install -m644 NEWS "$pkgdir/usr/share/doc/$pkgname"
  install -m644 hints.adoc "$pkgdir/usr/share/doc/$pkgname"
  install -m644 history.adoc "$pkgdir/usr/share/doc/$pkgname"
  install -m644 README.adoc "$pkgdir/usr/share/doc/$pkgname"
  install -m644 notes.adoc "$pkgdir/usr/share/doc/$pkgname"
  install -m644 advent.6 "$pkgdir/usr/share/man/man6"
}
