# Maintainer: Ben Ruijl <benruyl@gmail.com> 
pkgname=form
_pkgid=${pkgname}
pkgver=4.2.0
pkgrel=1
pkgdesc="Symbolic Manipulation System developed at Nikhef."
arch=('i686' 'x86_64')
url="https://www.nikhef.nl/~form/"
license=('GPL')
depends=('gmp>=4.2' 'zlib>=1.2')
makedepends=('autoconf')
provides=('form')
conflicts=('form-git')
source=("https://github.com/vermaseren/form/releases/download/v${pkgver}/form-${pkgver}.tar.gz")
md5sums=('dc7bac60eab4d7f5a2436b1cad34f22b')

build(){
	cd $_pkgid-$pkgver
	autoreconf -i
	./configure --prefix=/usr
        make ${MAKEFLAGS}
}

package() {
	cd $_pkgid-$pkgver
	make DESTDIR="$pkgdir/" install
        mkdir -p $pkgdir/usr/share/man/man1
        install doc/form.1 $pkgdir/usr/share/man/man1
}
