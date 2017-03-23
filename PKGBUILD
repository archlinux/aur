# Maintainer: ava1ar <mail(at)ava1ar(dot)info>

pkgname=freelib-bin
_pkgname=freeLib
pkgver=5.0.1
pkgrel=1
pkgdesc="Home library with librusec/flibusta support (binary build)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/freelibdesign/"
license=('GPL')
source=('freeLib.desktop' "http://sourceforge.net/projects/freelibdesign/files/${pkgver}/${_pkgname}${pkgver}.tar.gz")
depends=()
depends_x86_64=('lib32-gstreamer0.10-base' 'lib32-libxcomposite' 'lib32-libxrender' 'lib32-libxslt' 'lib32-libpulse')
depends_i686=('gstreamer0.10-base' 'libxcomposite' 'libxrender' 'libxslt' 'libpulse')
sha1sums=('fe6f56d29dea9a973bf90fec7f0f44fb7b2d8287'
          '7816f2afcef4d7fd77af2a1c92ecc3e27e63cf40')
 
package() {
	# coping files
	mkdir "${pkgdir}"/opt
	cp -R "${srcdir}"/${_pkgname} "${pkgdir}"/opt
	mkdir -p "${pkgdir}"/usr/share/applications
	cp "${startdir}"/${_pkgname}.desktop "${pkgdir}"/usr/share/applications
	# patching startup script
	sed -i 's/sh/sh\ncd $(dirname $0)/' "${pkgdir}"/opt/${_pkgname}/${_pkgname}.sh	
	# cleanup
	find "${pkgdir}" -name ".*" | xargs rm -rf
	rm "${pkgdir}/opt/freeLib/bin/Help/Копия script.js"
}
