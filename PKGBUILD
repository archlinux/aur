_pkgname=jpl_eph
pkgname=pluto-jpl-eph-git
pkgver=20230411.5fccf11
pkgrel=4
pkgdesc="Code to read, use, and manipulate JPL DE ephemeris data"
arch=(x86_64)
url="http://www.projectpluto.com/jpl_eph.htm"
license=(GPL3)
provides=(pluto-jpl-eph)
makedepends=('git')
source=("git+https://github.com/Bill-Gray/jpl_eph.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short --abbrev=7 | tr -d -
}

build() {
  cd "$srcdir/${_pkgname}"
  make all
}

package() {
  # install headers
  
  # install binary
  for bin in "asc2eph" "dump_eph" "eph2" "eph2asc" "ftest" "masses" "merge_de" "testeph"	
  do
	install -m755 -D "${srcdir}/${_pkgname}/${bin}"	"$pkgdir/usr/bin/${bin}"
  done
}
