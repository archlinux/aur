# Maintainer: AoyuJiao <aoyujiao050824@gmail.com>
# Contributor: Francesco Orofino <ivanhoe1024@gmail.com>
pkgname=datawarrior
pkgver=6.1.0
_pkgver=610
pkgrel=1
pkgdesc="Open-source data visualization and analysis program with embedded chemical intelligence"
arch=('any')
url="http://www.openmolecules.org/datawarrior/index.html"
license=('GPL')
depends=('java-openjdk' 'java-openjfx' 'hicolor-icon-theme')
source=("https://openmolecules.org/datawarrior/$pkgname${_pkgver}.tar.gz")
md5sums=('8141e32024a61ca144e238f3d00ca2d6')

package() {
	cd "${pkgname}_linux"
	mkdir -p $pkgdir/opt/datawarrior
	cp -r datawarrior/* $pkgdir/opt/datawarrior/.
	cp resources/openmolecules-datawarrior.xml $pkgdir/opt/datawarrior/.
	
	chmod 755 $pkgdir/opt/datawarrior
	chmod 755 $pkgdir/opt/datawarrior/datawarrior
	
	install -dm755 "${pkgdir}/usr/share/applications"
	install -Dm644 "resources/openmolecules-datawarrior.desktop" "$pkgdir/usr/share/applications/openmolecules-datawarrior.desktop"
	
	install -dm755 "$pkgdir/usr/share/mime/packages"
	install -Dm644 $pkgdir/opt/datawarrior/openmolecules-datawarrior.xml $pkgdir/usr/share/mime/packages/openmolecules-datawarrior.xml

	for res in 128x128 96x96 64x64 48x48; do
    	install -Dm644 "resources/${res}/openmolecules-datawarrior.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/openmolecules-datawarrior.png"
    	install -Dm644 "resources/${res}/application-vnd.openmolecules.dwam.png" "${pkgdir}/usr/share/icons/hicolor/${res}/mimetypes/application-vnd.openmolecules.dwam.png"
		install -Dm644 "resources/${res}/application-vnd.openmolecules.dwaq.png" "${pkgdir}/usr/share/icons/hicolor/${res}/mimetypes/application-vnd.openmolecules.dwaq.png"
		install -Dm644 "resources/${res}/application-vnd.openmolecules.dwar.png" "${pkgdir}/usr/share/icons/hicolor/${res}/mimetypes/application-vnd.openmolecules.dwar.png"
		install -Dm644 "resources/${res}/application-vnd.openmolecules.dwas.png" "${pkgdir}/usr/share/icons/hicolor/${res}/mimetypes/application-vnd.openmolecules.dwas.png"
		install -Dm644 "resources/${res}/application-vnd.openmolecules.dwat.png" "${pkgdir}/usr/share/icons/hicolor/${res}/mimetypes/application-vnd.openmolecules.dwat.png"
		install -Dm644 "resources/${res}/application-vnd.openmolecules.sdf.png" "${pkgdir}/usr/share/icons/hicolor/${res}/mimetypes/application-vnd.openmolecules.sdf.png"	
  	done

	#launch datawarrior from the terminal								
	install -dm755 "${pkgdir}/usr/bin"
	echo "/opt/datawarrior/datawarrior" > ${pkgdir}/usr/bin/datawarrior
	chmod +x ${pkgdir}/usr/bin/datawarrior

}
