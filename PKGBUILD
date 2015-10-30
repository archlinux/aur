# Maintainer: Niko Rosvall <niko@byteptr.com>

pkgname=steel
pkgver=1.1
pkgrel=1
pkgdesc='Command line password manager.'
arch=('i686' 'x86_64')
url='https://www.steelpasswordmanager.org'
license=('GPL')
depends=('libmcrypt' 'mhash' 'sqlite')
makedepends=('git')
source=("$pkgname::git+https://gitlab.com/Rosvall/steel.git#tag=v$pkgver")

sha256sums=('SKIP')

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

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/man/man1
  mkdir -p "$pkgdir"/usr/share/doc/"$pkgname"

  install -m755 "$srcdir/$pkgname"/steel "$pkgdir"/usr/bin
  install -m644 "$srcdir/$pkgname"/steel.1 "$pkgdir"/usr/share/man/man1
  install -m644 "$srcdir/$pkgname"/README "$pkgdir"/usr/share/doc/"$pkgname"
  install -m644 "$srcdir/$pkgname"/NEWS "$pkgdir"/usr/share/doc/"$pkgname"
}
