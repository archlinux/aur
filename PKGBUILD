# Maintainer: Kyle Keen <keenerd@gmail.com?>
pkgname=gnuradio-simple-ra-git
_pkgname=simple_ra
pkgver=20160903
pkgrel=1
pkgdesc="Simple radio astronomy for Gnuradio."
url="http://sdr.osmocom.org/trac/"
arch=('any')
license=('GPL')
depends=('python2-pyserial' 'python2-pyephem' 'gnuradio-ra-blocks-git' 'gnuradio-osmosdr')
makedepends=('git')
source=("git+https://github.com/patchvonbraun/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname/"
  #echo "r$(git rev-list HEAD --count)"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" SYSPREFIX="${pkgdir}/usr" sysinstall
}
