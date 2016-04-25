# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: moostik <mooostik_at_gmail.com>
# Contributor: mick elliot <micke@sfu.ca>

pkgname=emboss
_pkgname=EMBOSS
pkgver=6.6.0
pkgrel=1
pkgdesc="A collection of molecular biology applications"
arch=('x86_64' 'i686')
url="http://emboss.sourceforge.net/"
depends=('gd' 'pcre' 'java-runtime')
optdepends=('libmysqlclient' 'postgresql-libs')
options=('!libtool')
license=('GPL2')
source=("http://debian.rub.de/ubuntu/pool/universe/e/emboss/emboss_$pkgver.orig.tar.gz")
md5sums=('cc3fca80cb0618deb10fa0d29fe90e4b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr --enable-large --with-x

  sed -i 's|$(bindir)/embossupdate|:|' Makefile
  JAVA_CFLAGS="-I$JAVA_HOME/include -I$JAVA_HOME/include/linux" make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/include/{pcre,pcreposix}.h"
}
