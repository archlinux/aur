_pkgname=jpl_eph
pkgname=pluto-jpl-eph-git
pkgver=r104.5fccf11
pkgrel=1
pkgdesc="Code to read, use, and manipulate JPL DE ephemeris data"
arch=(x86_64)
url="http://www.projectpluto.com/jpl_eph.htm"
license=(GPL3)
provides=(pluto-jpl-eph)
makedepends=('git' 'pluto-lunar')
source=("git+https://github.com/Bill-Gray/jpl_eph.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}"
  make all
}

package() {
  # install headers
  install -m644 -D "${srcdir}/${_pkgname}/jpleph.h"	"${pkgdir}/usr/local/include/jpleph.h"

  # install lib
  install -m644 -D "${srcdir}/${_pkgname}/libjpl.a"	"$pkgdir/usr/lib/libjpl.a"
  
  # install binary
  for bin in "asc2eph" "dump_eph" "eph2" "eph2asc" "ftest" "masses" "merge_de" "testeph"	
  do
	install -m755 -D "${srcdir}/${_pkgname}/${bin}"	"$pkgdir/usr/bin/${bin}"
  done
}
