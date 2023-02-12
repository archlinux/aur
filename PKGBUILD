# Maintainer: Sean Anderson <seanga2@gmail.com>
_oname='javalib'
pkgname=ocaml-$_oname
pkgver=3.2.2
pkgrel=4
pkgdesc="Parses Java .class files into OCaml data structures"
arch=('i686' 'x86_64')
url="https://github.com/javalib-team/javalib/"
license=('LGPL2')
depends=('ocaml>=4.0.0' 'ocaml-extlib>=1.5.1' 'ocaml-camlzip>=1.04' 'zlib')
makedepends=('ocaml-findlib')
options=(!strip)
changelog=
source=("https://github.com/javalib-team/$_oname/archive/$pkgver.tar.gz")
md5sums=('90174a2297d43891ee7ebaaf7d29b87e')

prepare() {
	cd "$_oname-$pkgver"
	sed -i 's,OCAMLPATH=$(LOCALDEST)'",OCAMLPATH=$srcdir/$_oname-$pkgver,g" Makefile.config.example
	sed -i 's,INSTALL = $(FINDER) install,INSTALL = $(FINDER) install'" -destdir $pkgdir/usr/lib/ocaml," Makefile.config.example
	sed -i "s,^OCAMLPATH=,export OCAMLPATH=$srcdir/$_oname-$pkgver," configure.sh
}

build() {
	cd "$_oname-$pkgver"
	DESTDIR=/usr ./configure.sh
	make
}

package() {
	cd "$_oname-$pkgver"
	mkdir -p $pkgdir/usr/lib/ocaml
	make install
}
