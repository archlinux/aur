# $Id$
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=jasper
pkgver=1.900.1
pkgrel=5
pkgdesc="A software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard"
arch=('i686' 'x86_64')
url="http://www.ece.uvic.ca/~mdadams/jasper/"
license=('custom:JasPer2.0')
depends=('libjpeg>=8' 'freeglut' 'libxi' 'libxmu' 'mesa')
makedepends=('unzip')
options=('!libtool')
source=(http://www.ece.uvic.ca/~mdadams/${pkgname}/software/${pkgname}-${pkgver}.zip jpc_dec.c.patch)
md5sums=('a342b2b4495b3e1394e161eb5d85d754'
	 '36de7128eea6f701c1e2e13ce5bd8d37')
sha1sums=('9c5735f773922e580bf98c7c7dfda9bbed4c5191'
	  'c1a0176a15210c0af14d85e55ce566921957d780')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	patch -Np1 < ${srcdir}/jpc_dec.c.patch || return 1
	./configure --prefix=/usr --mandir=/usr/share/man \
		--enable-shared || return 1
	make || return 1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make DESTDIR=${pkgdir} install || return 1
	install -Dm644 LICENSE \
		${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
}
