# Maintainer: Jasper Follas	follasjj@live.co.uk

pkgname=slump
pkgver=0.003.02
pkgrel=3
pkgdesc="A SLIGE-based random map generator for Freedoom"
arch=('i686' 'x86_64')
url="http://www.samiam.org/slump.html"
license=('custom')
depends=('glibc')
install=slump.install
source=('http://www.samiam.org/slump/old/slump/slump-0.003.02.tar.bz2'
	'license.txt')
md5sums=('40069d684fe9a47a659dbc5d8182b37d'
         '03dd7b8aeec8aea1cebe7d51d633e621')

build() {
  cd $srcdir/$pkgname-$pkgver

  # fix compiler flags
  sed -i "s|-g ||g" Makefile

  # add revenant to monster range and fix a naming bug
  sed 	-e '9229 s|FALSE|TRUE|' \
	-e 's|"slige|"slump|g' \
	-i slump.c

  # uncomment to add baron and hellknight (present in freedoom-svn only):
  # sed -i -e '9158 s|FALSE|TRUE|' -e '9246 s|FALSE|TRUE|' slump.c

  make FLAGS="${CFLAGS}" || return 1
}

package () {
  install -m755 -D $srcdir/$pkgname-$pkgver/slump $pkgdir/usr/bin/slump
  install -m644 -D $srcdir/license.txt $pkgdir/usr/share/licenses/custom/slump/license.txt
}
