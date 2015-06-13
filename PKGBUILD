# Maintainer: ava1ar <mail(at)ava1ar(dot)info>

pkgname=freelib
_pkgname=freeLib
pkgver=4.8.2
pkgrel=1
pkgdesc="Home library with librusec/flibusta support"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/freelibdesign/"
license=('GPL')
source=('freeLib.desktop' "http://sourceforge.net/projects/freelibdesign/files/${pkgver}/${_pkgname}${pkgver}.tar.gz")
sha1sums=('fe6f56d29dea9a973bf90fec7f0f44fb7b2d8287'
          'cc746f3c9d792fc8b56c32eeceffb27087ee949e')
if [ "$CARCH" == x86_64 ]; then
	depends=('lib32-gstreamer0.10-base' 'lib32-libxcomposite' 'lib32-libxext' 'lib32-libxrender' 'lib32-libxslt' 'lib32-mesa-libgl')
elif [ "$CARCH" == i686 ]; then
	depends=('gstreamer0.10-base' 'libxcomposite' 'libxext' 'libxrender' 'libxslt' 'mesa-libgl')
fi
 
package() {
	mkdir "${pkgdir}"/opt
	cp -R "${srcdir}"/${_pkgname} "${pkgdir}"/opt
	mkdir -p "${pkgdir}"/usr/share/applications
	cp "${startdir}"/${_pkgname}.desktop "${pkgdir}"/usr/share/applications
	# patching startup script
	sed -i 's/sh/sh\ncd $(dirname $0)/' "${pkgdir}"/opt/${_pkgname}/${_pkgname}.sh	
	# cleanup
	find "${pkgdir}" -name ".*" | xargs rm -rf
}
