# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astromatic-scamp
_pkgname=scamp
pkgver=2.10.0
pkgrel=1
pkgdesc="computes astrometric and photometric solutions for any arbitrary sequence of FITS images in a completely automatic way."
url="http://www.astromatic.net/software/scamp"
arch=('x86_64')
license=('GPL')
depends=('astromatic-sextractor' 'cdsclient')
makedepends=()
conflicts=()
replaces=()
backup=()
source=(https://github.com/astromatic/scamp/archive/v${pkgver}.tar.gz)
sha1sums=('59a8f9d8780ce07bcfef3d80c718141f0884d9dd')

build() {

	_COPTS="--enable-openblas --with-openblas-incdir=/usr/include"

	cd $srcdir/${_pkgname}-${pkgver}
	./autogen.sh
	./configure --prefix=/usr $_COPTS
	make
}

package() {

	cd $srcdir/${_pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

