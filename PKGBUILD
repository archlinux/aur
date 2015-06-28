# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libpng15
pkgver=1.5.22
pkgrel=2
pkgdesc="A collection of routines used to create PNG format graphics files (1.5 branch)"
arch=('i686' 'x86_64')
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=('zlib')
conflicts=('libpng<1.6')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/libpng/libpng-${pkgver}.tar.xz"{,.asc}
	"http://downloads.sourceforge.net/sourceforge/libpng-apng/libpng-${pkgver}-apng.patch.gz")
validpgpkeys=('8048643BA2C840F4F92A195FF54984BFA16C640F')

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

sha256sums=('29bff0fb911236654dc3dbe6aed9c6f557b1ceb6aa28bed13089cf2b85d0af76'
            'SKIP'
            'c7a624b53cc8d8a50602f5704682ceae8b6918bb703df5ad113ded84a9597e01')
