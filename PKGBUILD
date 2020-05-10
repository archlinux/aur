# Maintainer: b00rt00s <b00rt00s.aur@gmail.com>

pkgname=vesta
pkgver=3.4.8
pkgrel=4
pkgdesc="3D visualization program for structural models, volumetric data such as electron/nuclear densities, and crystal morphologies."
url="https://jp-minerals.org/vesta"
license=('custom')
arch=('x86_64')
depends=('gtk3' 'gtk2' 'glu' 'desktop-file-utils' 'libxtst' 'java-environment')

_url="https://jp-minerals.org/vesta/archives"
source_x86_64=("${_url}/${pkgver}/VESTA-gtk3.tar.bz2")
source=('VESTA.desktop' 'vesta.install')
md5sums=('fdd7040720e4b58a26caa7db09669acf'
         'caabe467168af9e44cf380af1abfe280')
md5sums_x86_64=('b646a3f2999aafc0969434019fa2c61b')
sha256sums=('4eae00cd081d7b628858a03593a265c6f7698461bd265b873198d5c347c151e4'
            '35d44e99185caa17fbf69938bcccc252fde70fb7bc2d407ef376ba512db08b43')
sha256sums_x86_64=('27eabe856200969712afe63225f3a9e5c5c2eea8fb98efa2d1f30f0bf757f9ed')
install="vesta.install"



package() {
	#prepare dirs
	mkdir -p ${pkgdir}/opt
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/licenses/vesta
	mkdir -p ${pkgdir}/usr/share/applications/
	
  
	cp -a ${srcdir}/VESTA-gtk3 ${pkgdir}/opt/VESTA
	chmod 755 ${pkgdir}/opt/VESTA
	
	#install desktop file
	install -m 644 ${srcdir}/VESTA.desktop ${pkgdir}/usr/share/applications/

	#link licence
	(	cd ${pkgdir}/usr/share/licenses/vesta
		ln -sf /opt/VESTA/Library_License vesta
	)

	#link executable
	(
		cd ${pkgdir}/usr/bin
		ln -sf /opt/VESTA/VESTA VESTA
	)
}
