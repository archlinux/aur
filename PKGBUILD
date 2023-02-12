# Maintainer: Sean Anderson <seanga2@gmail.com>
_oname='sawja'
pkgname="ocaml-$_oname"
pkgver='1.5.12'
pkgrel=1
pkgdesc="Provides a high level representation of Java .class files in OCaml"
arch=('i686' 'x86_64')
url="https://github.com/javalib-team/sawja/"
license=('GPL3')
depends=('ocaml>=4.0.0' 'ocaml-javalib>=2.3.3' 'perl' 'camlp4')
makedepends=('ocaml-findlib')
options=(!strip)
source=("https://github.com/javalib-team/$_oname/archive/$pkgver.tar.gz")
sha256sums=('2ddc9e07d949b5f4ad41542acbde337cb1222f452076bfd06376ca3cb50f7f65')

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
