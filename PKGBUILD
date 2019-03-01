# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>
# Set it to compile with openblas-lapack

pkgname=astromatic-sextractor
_pkgname=sextractor
pkgver=2.25.0
pkgrel=3
pkgdesc="builds a catalogue of objects from an astronomical image (build from source) "
url="http://www.astromatic.net/software/sextractor"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'openblas-lapack')
makedepends=()
provides=()
conflicts=('sextractor-bin')
replaces=('sextractor-bin')
backup=()
source=(https://github.com/astromatic/sextractor/archive/${pkgver}.tar.gz)
sha1sums=('3ed53d55c0c77cd98a38bff1bde1b0d6fc625c18')


build() {

	_COPTS="--enable-openblas --with-openblas-incdir=/usr/include"

	cd $srcdir/${_pkgname}-${pkgver}
	sh autogen.sh
	./configure --prefix=/usr $_COPTS
	make
}

package() {

	cd $srcdir/${_pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

}

