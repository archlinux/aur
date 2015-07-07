# Maintainer: Lari Tikkanen <lartza at wippies.com>
# Contributor: Joshua Hunt <snark1994 at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
pkgname=unnethack
pkgver=5.1.0
_pkgverdate=20131208
pkgrel=2
pkgdesc="Variant of NetHack. It features more randomness, more levels, more challenges and more fun than vanilla NetHack."
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/trac/unnethack/"
license=('custom')
depends=('bash')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver-$_pkgverdate.tar.gz)
md5sums=('8a5b925aedc3b7379b6adacc0f0b5915')

build() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgverdate"

  ./configure --bindir=/usr/bin --prefix=/usr/share/unnethack --with-owner=`id -un` --with-group=`id -gn` --enable-wizmode=`id -un` --enable-curses-graphics
  make
}

package(){
  cd "$srcdir/$pkgname-$pkgver-$_pkgverdate"

  make DESTDIR="$pkgdir" install
  install -D -m 644 dat/license $pkgdir/usr/share/licenses/$pkgname/license
}
