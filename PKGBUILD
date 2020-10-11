# Maintainer: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>

pkgname=libabigail
pkgver=1.7
pkgrel=1
pkgdesc='ABI Generic Analysis and Instrumentation Library'
arch=('i686' 'x86_64')
license=('LGPL3')
url='https://sourceware.org/libabigail/'
depends=('libxml2' 'elfutils' 'python')
source=('http://mirrors.kernel.org/sourceware/libabigail/libabigail-1.7.tar.gz')
sha512sums=('02971c8f760cd7c6e7f77ef323c93769270666652a8f491b30cce74aa9bc20e2c5113eca0a534b814e9c8567538b6b7b84d15687e0ac15cf8ece736b2f7e2261')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	autoreconf -fi
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --with-gnu-ld --enable-bash-completion --enable-cxx11 --disable-static --disable-apidoc --disable-manual
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
