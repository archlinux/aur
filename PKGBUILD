# Maintainer: Felix von Perger <frekkvb@gmail.com>

pkgname=libthreadar
pkgver=1.3.1
pkgrel=1
pkgdesc='A C++ library providing an abstracted set of C++ classes to manipulate threads in a very simple and efficient way.'
arch=('i686' 'x86_64')
url='http://libthreadar.sourceforge.net/'
license=('LGPL3')
makedepends=('doxygen')
source=("https://downloads.sourceforge.net/project/libthreadar/{$pkgver}/libthreadar-${pkgver}.tar.gz")
sha512sums=('6eefe4d2262a170ed04e6e9e7efaae2945b68012cfed2e4606f0d6089050f3e4059d4dca2141ae862c158f5161c5ebaaa35c3eeb431fab10263787e5b74deddf')
options=('!libtool')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc --disable-static --disable-build-html
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" pkgdatadir="/usr/share/doc/${pkgname}/html" install
	install -d "${pkgdir}/usr/share/doc/${pkgname}"
	install -pm644 AUTHORS ChangeLog NEWS README THANKS "${pkgdir}/usr/share/doc/${pkgname}"
	rm -rf "${pkgdir}/usr/share/doc/dar/html/man"
}
