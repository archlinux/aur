# Contributor: Niko Rosvall <niko@byteptr.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=steel
pkgver=1.4
pkgrel=2
pkgdesc='Command line password manager.'
arch=('i686' 'x86_64')
url='https://www.steelpasswordmanager.org'
license=('GPL')
depends=('libsteel')
makedepends=('git')
source=(https://github.com/nrosvall/steel/archive/v$pkgver.tar.gz)
sha256sums=('b6899e621d940a2e2d23e512ddb52734be83df2f4ea4eb7167e307c47135cbc4')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e '/^override/d' \
         -e 's/^\(PREFIX=\/usr\)\/local/\1/' \
	 Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package () {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/man/man1
  install -d "$pkgdir"/usr/share/doc/"$pkgname"

  install -m755 "$srcdir/$pkgname-$pkgver"/steel "$pkgdir"/usr/bin
  install -m644 "$srcdir/$pkgname-$pkgver"/steel.1 "$pkgdir"/usr/share/man/man1
  install -m644 "$srcdir/$pkgname-$pkgver"/README "$pkgdir"/usr/share/doc/"$pkgname"
  install -m644 "$srcdir/$pkgname-$pkgver"/NEWS "$pkgdir"/usr/share/doc/"$pkgname"
}
