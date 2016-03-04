# Contributor: Niko Rosvall <niko@byteptr.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=steel
pkgver=1.3
pkgrel=4
pkgdesc='Command line password manager.'
arch=('i686' 'x86_64')
url='https://www.steelpasswordmanager.org'
license=('GPL')
depends=('libsteel')
makedepends=('git')
source=(https://github.com/nrosvall/libsteel/archive/v1.0.tar.gz https://github.com/nrosvall/steel/archive/v1.3.tar.gz)
sha256sums=('1f041badbb0a02034dc2f183141c8ea17cf86ae0cc02917b6cd07ab821edb26a'
            'ed0206d932ab5d8cfe99a4c76e4eab57a5e692af71c467722cd36cdd3e65179a')

prepare() {
  cd "$srcdir/$pkgname"
  sed -i -e '/^override/d' \
         -e 's/^\(PREFIX=\/usr\)\/local/\1/' \
	 Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package () {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/man/man1
  install -d "$pkgdir"/usr/share/doc/"$pkgname"

  install -m755 "$srcdir/$pkgname"/steel "$pkgdir"/usr/bin
  install -m644 "$srcdir/$pkgname"/steel.1 "$pkgdir"/usr/share/man/man1
  install -m644 "$srcdir/$pkgname"/README "$pkgdir"/usr/share/doc/"$pkgname"
  install -m644 "$srcdir/$pkgname"/NEWS "$pkgdir"/usr/share/doc/"$pkgname"
}
