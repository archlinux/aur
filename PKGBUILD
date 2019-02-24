# Maintainer: b00rt00s <b00rt00s.aur@gmail.com>

pkgname=vesta
pkgver=3.4.6
pkgrel=1
pkgdesc="3D visualization program for structural models, volumetric data such as electron/nuclear densities, and crystal morphologies."
url="http://jp-minerals.org/vesta"
license=('custom')
arch=('x86_64')
depends=('gtk2' 'libpng12' 'glu' 'desktop-file-utils' 'libxtst' 'java-environment')

_url="http://jp-minerals.org/vesta/archives"
source_x86_64=("${_url}/${pkgver}/VESTA-x86_64.tar.bz2")
source=('VESTA.desktop' 'vesta.install')
install="vesta.install"

md5sums=('0dc025818c9c723e988e7c3460f1844a'
         'caabe467168af9e44cf380af1abfe280')
md5sums_x86_64=('1d4651e86193f305831aa5db3dcfe789')


package() {
	#prepare dirs
	mkdir -p ${pkgdir}/opt
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/licenses
	mkdir -p ${pkgdir}/usr/share/applications/
	
  
	cp -a ${srcdir}/VESTA-${CARCH} ${pkgdir}/opt/VESTA
	chmod 755 ${pkgdir}/opt/VESTA
	
	#install desktop file
	install -m 644 ${srcdir}/VESTA.desktop ${pkgdir}/usr/share/applications/

	#link licence
	(	cd ${pkgdir}/usr/share/licenses
		ln -sf /opt/VESTA/Library_License vesta
	)

	#link executable
	(
		cd ${pkgdir}/usr/bin
		ln -sf /opt/VESTA/VESTA VESTA
	)
}
