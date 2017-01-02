# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
pkgname=antennavis
pkgver=0.3.1_3
pkgrel=1
pkgdesc="Antenna radiation pattern visualization software"
arch=('i686' 'x86_64')
url="http://www.include.gr/antennavis.html"
license=('GPL2')
groups=('hamradio')
depends=('tk' 'glu' 'libxmu')
provides=('antennavis')
conflicts=('antennavis')
source=("http://www.include.gr/${pkgname}-${pkgver/_/-}.tar.gz"
	"local://${pkgname}.patch")
md5sums=('5cb077611eacc8a751330f3d46807870'
         '853face326efe5696f19268aaa19f8c8')

prepare() {
	cd "${pkgname}-${pkgver/_/-}"
	# Included makefile does not handle DESTDIR correctly
	patch -p1 -i "${srcdir}/${pkgname}.patch"
}

build() {
	cd "${pkgname}-${pkgver/_/-}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver/_/-}"
	make DESTDIR="${pkgdir}/" install
}
