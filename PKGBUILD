_pkgname=lunar
pkgname=pluto-lunar-git
pkgver=20230614.bb05de6
pkgrel=5
pkgdesc="Basic astronomical functions for solar system ephemerides, time systems, coordinate systems, etc"
arch=(x86_64)
url="https://www.projectpluto.com/source.htm"
license=(GPL2)
makedepends=('git')
provides=(pluto-lunar)
source=("git+https://github.com/Bill-Gray/lunar.git")
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
  for header in "afuncs.h" "brentmin.h" "cgi_func.h" "comets.h" "date.h" "get_bin.h" \
                "lunar.h" "mpc_func.h" "showelem.h" "stringex.h" "vislimit.h" "watdefs.h"
  do
  	install -m644 -D "${srcdir}/${_pkgname}/${header}"	"${pkgdir}/usr/local/include/${header}"
  done
	
  # install lib
  install -m644 -D "${srcdir}/${_pkgname}/liblunar.a"	"$pkgdir/usr/local/lib/liblunar.a"
 
  # install binary
  for bin in "add_off" "adestest" "astcheck" "astephem" "calendar" "cgicheck" "chinese" "colors" \
	     "colors2" "cosptest" "csv2ades" "dist" "easter" "get_test" "gtest" "htc20b" "jd" \
	     "jevent" "jpl2b32" "jsattest" "lun_test" "marstime" "moidtest" "mpc2sof" "mpc_time"  \
	     "oblitest" "persian" "parallax" "parallax.cgi" "phases" "prectest" \
	     "prectes2" "ps_1996" "ssattest" "tables" "test_des" "test_ref" "testprec" \
	     "themis" "them_cat" "uranus1" "utc_test"
  do
	install -m755 -D "${srcdir}/${_pkgname}/${bin}"	"$pkgdir/usr/bin/${bin}"
  done
}
