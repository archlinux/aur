# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Bill Powell <bill at billpowellisalive dot com>

pkgname=rhyme
pkgver=0.9
pkgrel=2
pkgdesc="Rhyming dictionary for the console."
arch=('i686' 'x86_64')
url="http://rhyme.sourceforge.net/"
license=('GPLv2')
depends=('gdbm' 'readline')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('dd5d6b94d5881e411c86c9a6daabaa70')

build() {
  cd "$srcdir/$pkgname-$pkgver/"

  # Remove "-ltermcap" from Makefile.
  # On my system, this library isn't needed, and breaks the compile.
  sed -i -e "s/-ltermcap//" Makefile

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/rhyme"
  install -d "$pkgdir/usr/share/man/man1"
  make RHYMEPATH="$pkgdir/usr/share/rhyme" BINPATH="$pkgdir/usr/bin" MANPATH="$pkgdir/usr/share/man/man1" install
}
