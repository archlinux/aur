# Maintainer: Sebastien Duthil <duthils@free.fr>
pkgname=open-adventure
pkgver=1.11
pkgrel=1
pkgdesc="Port of the 'Colossal Cave Adventure' text-based adventure game"
arch=('i686' 'x86_64')
url="http://www.catb.org/~esr/open-adventure/"
license=('BSD')
makedepends=('python' 'python-yaml' 'asciidoc')
conflicts=('advent')
source=(https://gitlab.com/esr/open-adventure/-/archive/${pkgver}/open-adventure-${pkgver}.tar.bz2)
sha256sums=('212011dce9ea32783c4f3b3686d2072ff795cf3fb811193065cc672ea804953b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make advent advent.6
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 advent "$pkgdir/usr/bin/advent"
  install -Dm644 COPYING "$pkgdir/usr/share/licences/$pkgname/COPYING"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" NEWS hints.adoc history.adoc README.adoc notes.adoc
  install -Dm644 advent.6 "$pkgdir/usr/share/man/man6/advent.6"
}
