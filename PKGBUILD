# Maintainer: x2b <psaoj.10.Toranaga-San@spamgourmet.com>

pkgname=optpp
pkgver=2.4
pkgrel=4
pkgdesc='An Object-Oriented Nonlinear Optimization Library'
url='https://software.sandia.gov/opt++/'
arch=('i686' 'x86_64')
license=('LGPL2.1')
options=('staticlibs')
source=("${url}/downloads/${pkgname}-${pkgver}.tar.gz")
sha1sums=('089fb515f2f2e8632d603f2d1306d39aa355e9f0')
makedepends=('blas' 'gcc-fortran')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure \
		--prefix=/usr \
		--includedir=/usr/include/opt++ \
		--enable-static=no \
		--enable-shared=yes

	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	make DESTDIR="${pkgdir}" install
	#install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
