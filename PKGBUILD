# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=libmseed
pkgver=2.19.5
pkgrel=1
pkgdesc="A framework for manipulation of SEED (Standard for the Exchange of Earthquake Data) data records."
arch=("x86_64")
url="https://github.com/iris-edu/libmseed"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('77a2d335416a1debd2e01251e9cbca5d7f81dc993dc59ca356810c24ab8c84ec')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's|@mkdir -p $(DESTDIR)$(LIBDIR)/pkgconfig|@mkdir -p $(DESTDIR){$(DATAROOTDIR)/pkgconfig,$(LIBDIR)}|' Makefile
  sed -i 's|$(DESTDIR)$(LIBDIR)/pkgconfig/mseed.pc|$(DESTDIR)$(DATAROOTDIR)/pkgconfig/mseed.pc|' Makefile
}

build() {
	cd "${pkgname}-${pkgver}"
	make shared
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir/}" PREFIX=/usr install
}
# vim:set ts=2 sw=2 et:
