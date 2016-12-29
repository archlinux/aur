# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libpng15
pkgver=1.5.28
_apngver=1.5.27
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
	"http://downloads.sourceforge.net/sourceforge/libpng-apng/libpng-${_apngver}-apng.patch.gz")
sha256sums=('1c3a2d939b6729de493ebc0b14aeaa1bdc4ffa80a75d2506bb2c75a0ff3ac8e9'
            'SKIP'
            '6a4534ff395047da45dd3cb9aecd1666531a6d5ee7c7a8cdfc470705f3e87732')

build() {
	cd libpng-${pkgver}

	# Add animated PNG (apng) support
	# see http://sourceforge.net/projects/libpng-apng/
	patch -p1 -i ../libpng-${_apngver}-apng.patch

	./configure --prefix=/usr
	make
}

package() {
	cd libpng-${pkgver}

	make DESTDIR="${pkgdir}" install

	rm -rf "${pkgdir}/usr/"{bin,include,lib/{pkgconfig,libpng.so,libpng.a},share}
}

