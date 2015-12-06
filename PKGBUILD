# Maintainer: Ricardo Catalinas Jiménez <r@untroubled.be>

pkgname=procmeter3-svn
pkgver=r394
pkgrel=1
pkgdesc='A system status monitor for Linux with X-Windows, displays system resource usage in multiple graphs'
arch=('i686' 'x86_64')
url='http://www.gedanken.org.uk/software/procmeter3'
depends=('libxaw')
makedepends=('svn')
license=('GPL')

source=("${pkgname}::svn+http://gedanken.org.uk/svn/procmeter3/trunk")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$pkgname"
  make procmeter3-xaw
}

package() {
  cd "$pkgname"
  make INSTDIR=/usr DESTDIR=$pkgdir install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/ProcMeter3/COPYING
}
