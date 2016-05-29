# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libpng15
pkgver=1.5.27
pkgrel=1
pkgdesc="A collection of routines used to create PNG format graphics files (1.5 branch)"
arch=('i686' 'x86_64')
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=('zlib')
conflicts=('libpng<1.6')
options=('!libtool')
validpgpkeys=('8048643BA2C840F4F92A195FF54984BFA16C640F')
source=("http://downloads.sourceforge.net/sourceforge/libpng/libpng-${pkgver}.tar.xz"{,.asc}
	"http://downloads.sourceforge.net/sourceforge/libpng-apng/libpng-${pkgver}-apng.patch.gz")
sha256sums=('082f57d79559ba16ca3f33899e1929a510ff82aaaf100720e58b138a8c248368'
            'SKIP'
            '6a4534ff395047da45dd3cb9aecd1666531a6d5ee7c7a8cdfc470705f3e87732')

build() {
	cd libpng-${pkgver}

	# Add animated PNG (apng) support
	# see http://sourceforge.net/projects/libpng-apng/
	patch -p1 -i ../libpng-${pkgver}-apng.patch

	./configure --prefix=/usr
	make
}

package() {
	cd libpng-${pkgver}

	make DESTDIR="${pkgdir}" install

	rm -rf "${pkgdir}/usr/"{bin,include,lib/{pkgconfig,libpng.so,libpng.a},share}
}

