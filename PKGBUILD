# $Id$
# Maintainer: Jason Edson <jaysonedson@gmail.com>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=flex-android
pkgver=9999
pkgrel=3
pkgdesc="Flex for building Android. 2.6 doesn't play well when building."
arch=('i686' 'x86_64')
url="http://flex.sourceforge.net"
license=('custom')
depends=('glibc' 'm4' 'sh')
provides=(flex)
conflicts=(flex)
install=flex.install
source=(http://downloads.sourceforge.net/sourceforge/flex/flex-2.5.39.tar.xz)
md5sums=('477679c37ff8b28248a9b05f1da29a82')

build() {
  cd $srcdir/flex-2.5.39
  ./configure --prefix=/usr
  make
}

check() {
  cd $srcdir/flex-2.5.39

  # these tests are incompatible with latest bison
  sed -i -e '/test-bison-yylloc/d' -e '/test-bison-yylval/d' tests/Makefile.in

  make check
}

package() {
  cd $srcdir/flex-2.5.39

  make DESTDIR=$pkgdir install
  ln -s flex ${pkgdir}/usr/bin/lex

  install -Dm644 COPYING \
  	$pkgdir/usr/share/licenses/flex-2.5.39/license.txt
}

