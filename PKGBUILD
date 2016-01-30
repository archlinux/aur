# Contributor: Niko Rosvall <niko@byteptr.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=steel
pkgver=1.3
_pkgver=1.0-14ec81fbffba79ba2bb663b4966af1d0e1b93e3f      # for libsteel
pkgrel=1
pkgdesc='Command line password manager.'
arch=('i686' 'x86_64')
url='https://www.steelpasswordmanager.org'
license=('GPL')
depends=('libmcrypt' 'mhash' 'sqlite')
makedepends=('git')
source=("$pkgname::git+https://gitlab.com/Rosvall/steel.git#tag=v$pkgver" "https://gitlab.com/Rosvall/libsteel/repository/archive.zip?ref=v1.0")
sha256sums=('SKIP'
            '2892843e6c9a47f761e77cd41e9f1a9d14c4b28489a99364202e2712070138bb')

prepare() {
  ln -s "$srcdir"/lib$pkgname-v$_pkgver libsteel
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
