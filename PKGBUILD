# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
_oname='sawja'
pkgname="ocaml-$_oname"
pkgver='1.5.3'
pkgrel=1
pkgdesc="Provides a high level representation of Java .class files in OCaml"
arch=('i686' 'x86_64')
url="http://sawja.inria.fr/"
license=('LGPL2')
depends=('ocaml>=4.0.0' 'ocaml-javalib>=2.3.3' 'perl' 'camlp4')
makedepends=('ocaml-findlib')
options=(!strip)
changelog=
source=("https://gforge.inria.fr/frs/download.php/file/37403/sawja-$pkgver.tar.bz2")
md5sums=('25ff421a3f932881234ed5b05b94ac8d')

prepare() {
	cd "$_oname-$pkgver"
	sed -i 's,INSTALL = $(FINDER) install,INSTALL = $(FINDER) install'" -destdir $pkgdir/usr/lib/ocaml," Makefile.config.example
}

build() {
	cd "$_oname-$pkgver"
	DESTDIR=/usr ./configure.sh
	make clean
	make -j1
}

package() {
	cd "$_oname-$pkgver"
	mkdir -p $pkgdir/usr/lib/ocaml
	make install
}
