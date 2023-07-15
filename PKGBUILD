_pkgname=pluto-jpl-eph
pkgname=pluto-jpl-eph-git
pkgver=20230411.5fccf11
pkgrel=1
pkgdesc="Code to read, use, and manipulate JPL DE ephemeris data"
arch=(x86_64)
url="http://www.projectpluto.com/jpl_eph.htm"
license=(GPL3)
makedepends=('git')
source=("git+https://github.com/Bill-Gray/jpl_eph.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/jpl_eph"
  git log -1 --format='%cd.%h' --date=short --abbrev=7 | tr -d -
}

build() {
  cd "$srcdir/jpl_eph"
  make
}

package() {
  install -m644 -D "${srcdir}/jpl_eph/libjpl.a" "$pkgdir/usr/lib/libjpl.a"
  install -m755 -D "${srcdir}/jpl_eph/asc2eph" "$pkgdir/usr/bin/asc2eph"
  install -m755 -D "${srcdir}/jpl_eph/dump_eph" "$pkgdir/usr/bin/dump_eph"
  install -m755 -D "${srcdir}/jpl_eph/eph2" "$pkgdir/usr/bin/eph2"
  install -m755 -D "${srcdir}/jpl_eph/eph2asc" "$pkgdir/usr/bin/eph2asc"
  install -m755 -D "${srcdir}/jpl_eph/ftest" "$pkgdir/usr/bin/ftest"
  install -m755 -D "${srcdir}/jpl_eph/masses" "$pkgdir/usr/bin/masses"
  install -m755 -D "${srcdir}/jpl_eph/merge_de" "$pkgdir/usr/bin/merge_de"
  install -m755 -D "${srcdir}/jpl_eph/testeph" "$pkgdir/usr/bin/testeph"
}
