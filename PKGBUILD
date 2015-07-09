# Maintainer: Alexander Scharinger <e1028732 at student dot tuwien dot ac dot at>
# Contributor: Gustavo A. Gomez Farhat <gustavo_dot_gomez_dot_farhat at gmail_dot_com>
pkgname=gecode
pkgver=4.4.0
pkgrel=1
pkgdesc="The Generic Constraint Development Environment"
arch=('i686' 'x86_64')
url="http://www.gecode.org"
license=('MIT')
# If qt4 is installed, gecode will compile with Gecode Interactive Search
# Tool Support (GIST).
# If you want GIST support or if you want pacman to maintain a dependency,
# cause you have qt4 already installed, then you will have to add qt4 in the
# depends array.
#depends=('mpfr' 'qt4')
depends=('mpfr')
source=(http://www.gecode.org/download/$pkgname-$pkgver.tar.gz)
# MD5 sum can not be found anywhere on the webpage. I generated it myself.
# Use the following shell command to update the md5 sum.
# $ makepkg -g >> PKGBUILD
md5sums=('a892852927b12ed291b435c72c085834')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-examples
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/include/examples/"
  install -m 644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
