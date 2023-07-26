# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astromatic-psfex
_pkgname=psfex
pkgver=3.24.2
pkgrel=1
pkgdesc="extracts models of the PSF from FITS images processed with sextractor"
url="http://www.astromatic.net/software/sextractor"
arch=('x86_64')
license=('GPL')
depends=('astromatic-sextractor' 'blas-openblas')
makedepends=()
provides=()
backup=()
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/astromatic/psfex/archive/${pkgver}.tar.gz)
sha256sums=('e2c94bf60d90e0db52ad4b8baa5d5fceb483eff6a87b35c6fc5a881fccc04af9')


build() {
	_COPTS="--enable-openblas"

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

