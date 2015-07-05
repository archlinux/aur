# Maintainer: Vincent Hourdin <aur at vinvin dot tf>
pkgname=goqat
pkgver=2.0.0
pkgrel=1
pkgdesc="Operates any CCD camera from Quantum Scientific Imaging (QSI) and autoguides telescopes."
url="http://canburytech.net/GoQat/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('goocanvas')
optdepends=('qsiapi: QSI CDD camera support'
'ds9: displays CCD images (FITS format)'
'xpa: communication mechanism used to bind to DS9'
'libparapin: parallel port support'
'grace: plotting support'
'sextractor: analyse GoQats video recordings'
'libraw1394: support of firewire cameras or coverters from The Imaging Source'
'v4l-utils: use v4l devices (webcams) for autoguiding')
source=("http://canburytech.net/GoQat/download/${pkgname}-${pkgver}.tar.gz")
sha1sums=('794f9a458c3da6b1f7c8068fe7a8c9f6f18fd426')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
#	sed -i 's/prefix/datarootdir/g' Makefile.am	# fix install dir
#	sed -i 's/prefix/datarootdir/g' src/Makefile.am	# fix install dir
#	truncate -s -290 Makefile.am			# remove post install hooks
#	aclocal && autoconf && autoheader && automake
	./configure --prefix=/usr
#	sed -i 's/$(MAKE) $(AM_MAKEFLAGS) install-data-hook//' Makefile
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

	# do the install hooks here since they cannot be executed in the DESTDIR environment
#	chmod +x ${pkgdir}/usr/share/GoQat/data/*.pl ${pkgdir}/usr/share/GoQat/data/*.sh
#	sed -i 's,@DATAROOTDIR\@,/usr/share,' "${pkgdir}/usr/share/GoQat/data/DemoTasks.txt"
}

