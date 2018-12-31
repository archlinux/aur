# Maintainer: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>
pkgname=siril-git
_gitname=siril
pkgver=759a832
pkgrel=1
pkgdesc="An astronomical image processing software for Linux. (IRIS clone)"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('gtk3' 'fftw' 'cfitsio' 'gsl' 'libconfig' 'opencv')
makedepends=('intltool')
url="https://free-astro.org/index.php/Siril"
optdepends=('libpng: PNG import'
'libjpeg: JPEG import and export'
'libtiff: TIFF import and export'
'libraw: DSLR RAW images import'
'ffms2: films native support as image sequences and import'
'libcurl-gnutls: online astrometry'
)
source=('git+https://gitlab.com/free-astro/siril.git')
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	git log -1 --format="%h"
}

build() {
	cd "${_gitname}"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "${_gitname}"
	make DESTDIR="${pkgdir}" install
	install -v -d ${pkgdir}/usr/share/applications/
	install -v -d ${pkgdir}/usr/share/mime/packages/
	install -v -m 644 platform-specific/linux/org.free-astro.siril.desktop ${pkgdir}/usr/share/applications/
	install -v -m 644 platform-specific/linux/siril.xml ${pkgdir}/usr/share/mime/packages/
}
