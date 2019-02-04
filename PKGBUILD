# Maintainer: Ben Ruijl <benruyl@gmail.com> 
pkgname=form
_pkgid=${pkgname}
pkgver=4.2.1
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
md5sums=('5d4357bf60bd3629ef68fbc49a3ef61e')

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
