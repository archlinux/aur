# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=cdb
pkgver=0.75
pkgrel=4
pkgdesc="A fast, reliable, simple package for creating and reading constant databases"
arch=('i686' 'x86_64')
url="http://cr.yp.to/cdb.html"
license=(public-domain)
conflicts=(tinycdb)
source=(http://cr.yp.to/cdb/$pkgname-$pkgver.tar.gz)
md5sums=('81fed54d0bde51b147dd6c20cdb92d51')

build() {
  cd $srcdir/$pkgname-$pkgver

  # Set install prefix
  echo /usr > conf-home

  # A little patch, borrowed from Gentoo Portage
  sed -e 's/^extern int errno;$/#include <errno.h>/' -i error.h

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  # don't use make setup, but move the binaries ourselves
  mkdir -p ${pkgdir}/usr/bin/
  install -m 755 -t ${pkgdir}/usr/bin/ cdbdump cdbget cdbmake cdbmake-12 cdbmake-sv cdbstats cdbtest
}
# vim:syntax=sh
