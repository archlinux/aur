# Maintainer: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>

pkgname=libabigail
pkgver=1.8.2
pkgrel=1
pkgdesc='ABI Generic Analysis and Instrumentation Library'
arch=('i686' 'x86_64')
license=('LGPL3')
url='https://sourceware.org/libabigail/'
depends=('libxml2' 'elfutils' 'python')
source=('http://mirrors.kernel.org/sourceware/libabigail/libabigail-1.8.2.tar.gz')
sha512sums=('fa8edaf39632e26430481f15e962a098459eac087074e85ca055293ba324ec5944c45880fcb36f1c54a64652605a439cbf9247dfea9bfd3ec502cc7292dd1c8d')

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
