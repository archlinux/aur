# Maintainer: Ilya Elenskiy <elenskiy.ilya[@]gmail[.]com>
# Contributor: Sergey Marochkin <me@ziggi.org>

pkgname=comedilib
pkgver=0.12.0
pkgrel=1
pkgdesc="Comedi is the kernel-level driver code. Comedilib is the user-level API library code. This package includes official python bindings."
arch=('i686' 'x86_64')
url="http://comedi.org/"
license=('LGPL2')
makedepends=('swig')
source=("http://www.comedi.org/download/comedilib-$pkgver.tar.gz")
sha512sums=('e2df049e1b23b6488ba426b48d4701faabfca2ccfeb439b67fb69f2fe13320d3f2d48ec93233805a1277c27af8e5f916f6d91de2e71a0cc710b38eed8519b2ff')

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc \
		--disable-firmware \
		--localstatedir=/var \
		--disable-dependency-tracking \
		--disable-ruby-binding \
		--with-pdf-backend=no \
		--disable-static

	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR="$pkgdir/" install
}
