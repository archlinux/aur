# Maintainer: Sebastien Duthil <duthils@free.fr>
pkgname=open-adventure
pkgver=1.3
pkgrel=1
pkgdesc="Port of the 'Colossal Cave Adventure' text-based adventure game"
arch=('i686' 'x86_64')
url="http://www.catb.org/~esr/open-adventure/"
license=('BSD')
makedepends=('python' 'python-yaml' 'asciidoc')
conflicts=('advent')
source=(${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/esr/open-adventure/repository/archive.tar.bz2?ref=${pkgver})
sha256sums=('cef0d37d65ac8f55c24f73158ae2048db1b8f25df8094ed1f12233842d327b72')

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
