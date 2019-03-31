# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astromatic-psfex
_pkgname=psfex
pkgver=3.21.1
pkgrel=2
pkgdesc="extracts models of the PSF from FITS images processed with sextractor"
url="http://www.astromatic.net/software/sextractor"
arch=('x86_64')
license=('GPL')
depends=('astromatic-sextractor')
makedepends=()
provides=()
backup=()
source=(https://github.com/astromatic/psfex/archive/${pkgver}.tar.gz)
sha1sums=('b2b33fdde68230de21cfb6868fb999b5d30fcea4')


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

