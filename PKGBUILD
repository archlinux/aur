# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Oguz Han Asnaz <O.Asnaz@gmx.net>

pkgname=rpncalc
pkgver=1.36.8
pkgrel=3
pkgdesc="A calculator similar to dc, but uses readline and shows the stack visually."
arch=('i686' 'x86_64')
#url="http://packages.debian.org/squeeze/rpncalc"
url="http://homepage.hispeed.ch/david.frey/"
license=('GPL2')
depends=('readline')
makedepends=('bison' 'flex' 'gettext' 'ed')
#source=("http://ftp.de.debian.org/debian/pool/main/r/${pkgname}/${pkgname}_${pkgver}.tar.gz")
#source=("http://www-cs.stanford.edu/pub/mirrors/ubuntu/ubuntu/pool/universe/r/rpncalc/rpncalc_$pkgver.tar.gz")
source=("http://old-releases.ubuntu.com/ubuntu/pool/universe/r/rpncalc/rpncalc_$pkgver.tar.gz")
#source=("https://github.com/AfoHT/rpncalc/archive/v$pkgver.tar.gz")
md5sums=('53c56b3cc539f214c2c26d5af62d878d')

prepare() {
  cd "$srcdir/$pkgname"
  sed -i 's|ed .* proto.ed$|LANG=C &|' Makefile
  # libm removed the pow10 functions
  sed -i 's|pow10|exp10|' {cmds.h,scan.l}
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
