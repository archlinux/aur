# Maintainer: Kyle Keen <keenerd@gmail.com?>
pkgname=gnuradio-simple-ra-svn
_pkgname=simple_ra
pkgver=r1252
pkgrel=1
pkgdesc="Simple radio astronomy for Gnuradio."
url="http://sdr.osmocom.org/trac/"
arch=('any')
license=('GPL')
depends=('python2-pyserial' 'python2-pyephem' 'gnuradio-ra-blocks-svn')
makedepends=('svn')
source=("svn+https://www.cgran.org/svn/projects/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname/"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$_pkgname/trunk"
  make
}

package() {
  cd "$srcdir/$_pkgname/trunk"
  make DESTDIR="${pkgdir}" SYSPREFIX="${pkgdir}/usr" sysinstall
}
