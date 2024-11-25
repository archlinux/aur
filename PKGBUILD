# Maintainer: Sebastien Duthil <duthils@duthils.net>
pkgname=open-adventure
pkgver=1.16
pkgrel=3
pkgdesc="Port of the 'Colossal Cave Adventure' text-based adventure game"
arch=('i686' 'x86_64')
url="http://www.catb.org/~esr/open-adventure/"
license=('BSD')
makedepends=('python' 'python-yaml' 'asciidoc' 'libedit')
conflicts=('advent')
source=(https://gitlab.com/esr/open-adventure/-/archive/${pkgver}/open-adventure-${pkgver}.tar.bz2)
sha256sums=('a151e3f918224e7f2495eeb2872bfe4f5dd95e8233ba2691c87c74303ad29747')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make advent advent.6
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  LC_ALL=C make -k -j1 check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 advent "$pkgdir/usr/bin/advent"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" NEWS.adoc hints.adoc history.adoc README.adoc notes.adoc
  install -Dm644 advent.6 "$pkgdir/usr/share/man/man6/advent.6"
}
