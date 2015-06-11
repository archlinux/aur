# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=cedilla
pkgver=0.7
pkgrel=1
pkgdesc="A simple text printer that uses Unicode internally"
arch=(any)
url="http://www.pps.jussieu.fr/~jch/software/cedilla/"
license=('GPL')
depends=(clisp texlive-core)
makedepends=()
source=(http://www.pps.jussieu.fr/~jch/software/files/$pkgname-$pkgver.tar.gz)
md5sums=('57d2a80d3fd8fdc72827ada5e6257be2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./compile-cedilla
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # the install-cedilla script would not find the man path in fakeroot, so
  # we need to create the dirs for it
  source cedilla-config
  mkdir -p $pkgdir/$MANDIR

  TARGET=$pkgdir ./install-cedilla
  sed -i -e 's/texmf-tetex/texmf-dist/g' $pkgdir/etc/cedilla-config.lisp
}

