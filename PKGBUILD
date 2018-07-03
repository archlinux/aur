# Maintainer: Vincent Hourdin <aur at vinvin dot tf>
pkgname=goqat
pkgver=2.1.3
pkgrel=1
pkgdesc="Operates any CCD camera from Quantum Scientific Imaging (QSI) and autoguides telescopes."
url="http://canburytech.net/GoQat/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('goocanvas' 'libindi' 'qsiapi>7.2')
optdepends=('ds9: displays CCD images (FITS format)'
'xpa: communication mechanism used to bind to DS9'
'libparapin: parallel port support'
'grace: plotting support'
'sextractor: analyse GoQats video recordings'
'libraw1394: support of firewire cameras or coverters from The Imaging Source'
'v4l-utils: use v4l devices (webcams) for autoguiding')
source=("http://canburytech.net/GoQat/download/${pkgname}-${pkgver}.tar.gz")
sha1sums=('b3b273f3fee410a5ca727297b9a3ad8d6369c9c5')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	LIBS='-lnova -lftdi1' ./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
