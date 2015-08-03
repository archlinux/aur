# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libpng15
pkgver=1.5.23
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
sha256sums=('1f2dc3278e9d0c3aba618f9d585c24d744d65cad76cf799c9405085033e41f12'
            'SKIP'
            'c1916ce42cd189990f8a9a3a0dd0216fc366d82fdfb7935de88603ce04eb3362')

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

