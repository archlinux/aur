# Maintainer : arthur33 <sohieradrien@gmail.com>
pkgname='smartdeblur-git'
pkgver=20130304
pkgrel=1
pkgdesc='A smart deblur program made by Y. Vladimir'
arch=('i686' 'x86_64')
url='http://yuzhikov.com/articles/BlurredImagesRestoration1.htm'
license=('GPLv3')
depends=('qt4' 'fftw')
makedepends=('git')
provides=('smartdeblur')

_gitroot='https://github.com/Y-Vladimir/SmartDeblur.git'
_gitname='SmartDeblur'

build () {
	cd "${srcdir}"
	if [ -d "${_gitname}" ] ; then
		msg "The files are updated"
	else
		git clone "${_gitroot}"
	fi
	cd "${_gitname}/src"
	qmake-qt4
	make
}
package() {
	cd "${srcdir}/${_gitname}/src"
	mkdir -p "${pkgdir}/usr/bin"
	cp SmartDeblur "${pkgdir}/usr/bin/"
	
	chmod 0755 "${pkgdir}/usr/bin"
	chmod 0755 "${pkgdir}/usr/bin/SmartDeblur"
}
