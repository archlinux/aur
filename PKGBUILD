# Maintainer: another <code § deadcode § eu>
# Contributor: (unknown)
pkgname=bitmap
pkgver=1.1.0
pkgrel=1
pkgdesc="X-bitmap (XBM) editor and converter utilities"
arch=('i686' 'x86_64')
url="http://www.x.org/"
license=('MIT')
depends=('libxaw>=1.0.7')
makedepends=('xbitmaps')
source=(https://www.x.org/releases/individual/app/${pkgname}-${pkgver}.tar.xz{,.sig})
sha256sums=('8e86879c2feeece3f10e189330479cf51da0dd268355d1e3ee8a8497ab833690'
            'SKIP')
sha512sums=('3d6c94675f10772daeb71598c3e0ddcb51569b1bfc4771159e9df89599bfeb8bf49f464c24fef54d30a8f737af32136f859f844be03e088d24ed962f88381193'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>

build(){
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install
	install -D -m 0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

	# conflicts with 'mesa-demos'
	mv "${pkgdir}/usr/bin/bitmap" "${pkgdir}/usr/bin/bitmap-xorg"
}
