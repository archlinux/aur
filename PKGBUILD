# Maintainer: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Ken Bull <llubnek@gmail.com>
# Contributor: Todd Musall <tmusall@comcast.net>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=idutils
pkgver=4.6
pkgrel=1
pkgdesc="A package of language independent tools that indexes program identifiers, literal numbers, \
	or words of human-readable text."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/idutils/"
license=('GPL')
depends=('bash')
replaces=('id-utils')
source=(ftp://ftp.gnu.org/gnu/idutils/idutils-$pkgver.tar.xz)
md5sums=('99b572536377fcddb4d38e86a3c215fd')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i -e '/gets is a security/d' lib/stdio.in.h
  ./configure --prefix=/usr --disable-gcc-warnings --disable-silent-rules
  #export LC_CTYPE=ISO-8859-1
  make VERBOSE=1 || return 1
}

package () {
  cd $startdir/src/$pkgname-$pkgver
  make DESTDIR=$startdir/pkg install
  # why was this necessary?
  #mkdir -p $startdir/pkg/usr/share/misc
  #mv $startdir/pkg/usr/share/id-lang.map $startdir/pkg/usr/share/misc/
}
