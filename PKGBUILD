# Contributor: Daniel Milde <daniel@milde.cz>
pkgname=seaside
pkgver=3.1
pkgrel=1
pkgdesc="Web application framework written in Smalltalk"
arch=(i686 x86_64)
url="http://seaside.st/"
license=('MIT')

source=(http://www.seaside.st/distributions/Seaside-${pkgver}-OneClick.zip run.sh seaside.desktop)
md5sums=('3d7993215b0fe360079745b341008b2f'\
		 'f202757123b2e587d7f7efde8c2958b9'\
		 'e33ed6f2119d9cd088803cf8b8c3b997')


build() {
	cd ${srcdir}/Seaside.app/
	rm -fr ${srcdir}/Seaside.app/Contents/MacOS/
	rm -fr ${srcdir}/Seaside.app/Contents/Windows/
	
	install -d --group=users ${pkgdir}/usr/share/seaside
	install -d ${pkgdir}/usr/bin/
	
	cp -fr ${srcdir}/Seaside.app/* ${pkgdir}/usr/share/seaside
	
	chgrp -R users ${pkgdir}/usr/share/seaside
	chmod -R 775 ${pkgdir}/usr/share/seaside
	
	install -Dm755 ${srcdir}/run.sh ${pkgdir}/usr/bin/seaside

	install -d ${pkgdir}/usr/share/applications
	install -Dm644 ${srcdir}/../${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	
	install -d ${pkgdir}/usr/share/pixmaps
	install ${srcdir}/Seaside.app/Contents/Resources/Squeak.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
}


