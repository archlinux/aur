# Maintainer: Luke <gaming4jc2@yahoo.com> GPG: E6C7793E
pkgname=tankatwar
pkgver=1.2.1
pkgrel=1
pkgdesc="TANK@WAR is a solo and team-based multiplayer 3D online game dedicated to armored warfare set in the modern age. Throw yourself into epic tank 
battles.."
arch=('x86_64')
url=('http://tankatwar.com/')
license=('Custom')
depends=('openal' 'lib32-openal' 'lib32-mesa')
source=('http://tankatwar.com/files/TANK@WAR-1.2.1-linux64.tar.gz'
	${pkgname}.png ${pkgname}.desktop)
sha256sums=('81a9835ea646076e42cc699ef30bbb3ab80e50b6567ae17b64a1aca355cc96f8'
         '6c1c711d786990c3a2a003f0bba61b56194802f7f2da52081af8c2eeb426b73c'
         '1860f7c9875b1d3b4ce5c03e4754606547fb09f8193bc25fa3ef906f90fd608e')

package() {
	cd "${srcdir}/TANK@WAR-1.2.1-linux64"
	rm -rf shared_libs
	rm start_client.sh
	rm client.ini~
	mkdir -p ${pkgdir}/usr/bin
	echo "#!/bin/bash" > $pkgdir/usr/bin/$pkgname
	echo "cd /opt/$pkgname/ && ./Client" >> $pkgdir/usr/bin/$pkgname
	chmod 755 $pkgdir/usr/bin/$pkgname
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp * -r ${pkgdir}/opt/${pkgname}
	chmod -R 755  ${pkgdir}/opt/$pkgname/Client
	mkdir -p ${pkgdir}/usr/share/pixmaps
	mkdir -p ${pkgdir}/usr/share/applications/
	install -m 644 "${srcdir}/${pkgname}.png"  ${pkgdir}/usr/share/pixmaps
	install -m 644 "${srcdir}/${pkgname}.desktop"  ${pkgdir}/usr/share/applications
}
