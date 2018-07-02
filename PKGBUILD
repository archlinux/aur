# $Id$
# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>
#
# NOTE: based on the PKBUILD of ddlibnova.15
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libnova14-compat
pkgver=0.14.0
pkgrel=2
pkgdesc="A general purpose, double precision, celestial mechanics, astrometry and astrodynamics library."
url="http://libnova.sourceforge.net/"
license=('GPL2')
arch=('x86_64' 'arm' 'armv6h' 'armv7h')
depends=('glibc')
source=(http://downloads.sourceforge.net/sourceforge/libnova/libnova-$pkgver.tar.gz)
sha256sums=('d425eda53de1d3fcfcca259ba7735f793e0f3607d92b84e4b5d63ba554ec1335')

build() {
	cd "${srcdir}/libnova-${pkgver}"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
  cd "${srcdir}/libnova-${pkgver}"
	make DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/include"
  rm "${pkgdir}/usr/lib/libnova.so"
}
