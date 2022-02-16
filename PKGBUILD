# Maintainer: Hugo Hörnquist <hugo@lysator.liu.se>

pkgname=guile-gash
pkgver=0.3.0
pkgrel=1
pkgdesc='POSIX-compatible shell and Guile library for parsing shell scripts.'
arch=(any)
license=(GPL3)
depends=('guile>=2.0.9')
url=https://savannah.nongnu.org/projects/gash/
options=(!strip)
source=(http://download.savannah.nongnu.org/releases/gash/gash-${pkgver}.tar.gz{,.sig}
		gash-header.patch)
validpgpkeys=( D6B0C593DA8C5EDCA44C7A58C33691F71188B004 )
md5sums=('e45c8bcda9acc3b87154104449a3e468'
         'SKIP'
         'd98b27a988800f5b00602fdb8d2ec1f2')

prepare() {
	cd "$srcdir/gash-$pkgver"
	patch -p1 -i "$srcdir/gash-header.patch"
}

build(){
	cd "$srcdir/gash-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/gash-$pkgver"
	make check
}

package() {
	cd "$srcdir/gash-$pkgver"
	make DESTDIR=$pkgdir install
}
