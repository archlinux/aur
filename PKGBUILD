_pkgname=jpl_eph
pkgname=pluto-jpl-eph-git
pkgver=20230411.5fccf11
pkgrel=2
pkgdesc="Code to read, use, and manipulate JPL DE ephemeris data"
arch=(x86_64)
url="http://www.projectpluto.com/jpl_eph.htm"
license=(GPL3)
makedepends=('git')
source=("git+https://github.com/Bill-Gray/jpl_eph.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short --abbrev=7 | tr -d -
}

build() {
  cd "$srcdir/${_pkgname}"
  make
}

package() {
  install -m644 -D "${srcdir}/${_pkgname}/libjpl.a"	"$pkgdir/usr/lib/libjpl.a"
  install -m755 -D "${srcdir}/${_pkgname}/asc2eph"	"$pkgdir/usr/bin/asc2eph"
  install -m755 -D "${srcdir}/${_pkgname}/dump_eph"	"$pkgdir/usr/bin/dump_eph"
  install -m755 -D "${srcdir}/${_pkgname}/eph2"		"$pkgdir/usr/bin/eph2"
  install -m755 -D "${srcdir}/${_pkgname}/eph2asc"	"$pkgdir/usr/bin/eph2asc"
  install -m755 -D "${srcdir}/${_pkgname}/ftest"	"$pkgdir/usr/bin/ftest"
  install -m755 -D "${srcdir}/${_pkgname}/masses"	"$pkgdir/usr/bin/masses"
  install -m755 -D "${srcdir}/${_pkgname}/merge_de"	"$pkgdir/usr/bin/merge_de"
  install -m755 -D "${srcdir}/${_pkgname}/testeph"	"$pkgdir/usr/bin/testeph"
}
