# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astromatic-scamp
_pkgname=scamp
pkgver=2.6.7
pkgrel=3
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
sha1sums=('e52abdf41c617f94dfc93a43d020b8e044f291ec')

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

