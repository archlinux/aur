# Contributor: Alexander Scharinger
# Contributor: Gustavo A. Gomez Farhat <gustavo_dot_gomez_dot_farhat at gmail_dot_com>
pkgname=gecode
pkgver=6.0.1
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
sha512sums=('84be35c0bd6ff4814932027adce738aa896e3f53ef6c845664432dcc5fa5b6b53b316b870150c64ed9cb56151cfef8604d0882ee50e1e47d10873ea09d4be82e')

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
