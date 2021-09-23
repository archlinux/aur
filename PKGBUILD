# Maintainer:  Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Alexander Scharinger
# Contributor: Gustavo A. Gomez Farhat <gustavo_dot_gomez_dot_farhat at gmail_dot_com>
pkgname=gecode
pkgver=6.2.0
pkgrel=2
pkgdesc="The Generic Constraint Development Environment"
arch=('i686' 'x86_64')
url="http://www.gecode.org"
license=('MIT')
# If qt4 is installed, gecode will compile with Gecode Interactive Search
# Tool Support (GIST).
# If you want GIST support or if you want pacman to maintain a dependency,
# cause you have qt4 already installed, then you will have to add qt4 in the
# depends array.
#depends=('qt4')
# For support for trigonometric and transcendental float constraints you will
# need to use the following dependencies and additionaly add the directories to
# the arguments of the configure call in the build() function.
# For further inormation see section 2.6.2 of the Gecode documentation
# "Modeling and Programming with Gecode".
#depends=('mpfr' 'gmp')
source=("https://github.com/$pkgname/$pkgname/archive/release-$pkgver.tar.gz")
# MD5 sum can not be found anywhere on the webpage.
# Use the following shell command to generate and update the md5 sum.
# $ makepkg -g >> PKGBUILD
sha512sums=('a763127ba786df86b33f4be1b25226f51bd5d059ea336912e7bd3ec5c54c2fed93f2e5a662793688723495193a42204c0db440b19de8614414ebbe5d2d2d51ed')

build() {
  cd "$srcdir/$pkgname-release-$pkgver"
  ./configure --prefix=/usr --disable-examples
  #./configure --prefix=/usr --disable-examples --with-mpfr-include=/usr/include/ --with-mpfr-lib=/usr/lib/ --with-gmp-include=/usr/include/ --with-gmp-lib=/usr/lib/
  make
}

package() {
  cd "$srcdir/$pkgname-release-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/include/examples/"
  install -m 644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
