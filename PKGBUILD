# Maintainer:  Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Alexander Scharinger
# Contributor: Gustavo A. Gomez Farhat <gustavo_dot_gomez_dot_farhat at gmail_dot_com>
pkgname=gecode
pkgver=6.1.1
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
#depends=('qt4')
# For support for trigonometric and transcendental float constraints you will
# need to use the following dependencies and additionaly add the directories to
# the arguments of the configure call in the build() function.
# For further inormation see section 2.6.2 of the Gecode documentation
# "Modeling and Programming with Gecode".
#depends=('mpfr' 'gmp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/release-$pkgver.tar.gz")
# MD5 sum can not be found anywhere on the webpage.
# Use the following shell command to generate and update the md5 sum.
# $ makepkg -g >> PKGBUILD
sha512sums=('772c9a769e56803f5b2d9c0e9aa7266c3a2aa9e988f94849349f5062c2598e9b1578257b4690f47342a12e5aa3223d9be6d8826c3bb391a63b7112c1f911d5f0')

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
