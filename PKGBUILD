# Maintainer: Alfonso Saaverda "Son Link" <sonlink.dourden@gmail.com>

pkgname=maldita-castilla
pkgver=1.0
pkgrel=3
pkgdesc="Maldita Castilla (Cursed/damn Castile) is an action arcade game like Ghost and Goblins full of myths from Spain and the rest of Europe"
arch=('i686' 'x86_64')
url='http://www.locomalito.com/maldita_castilla.php'
license=('CCPL')
depends=('zlib' 'openssl' 'openal' 'mesa')
if [ "$CARCH" = "x86_64" ]; then
	depends+=('lib32-zlib' 'lib32-openssl' 'lib32-openal' 'lib32-mesa')
fi
source=('http://www.locomalito.com/juegos/Maldita_Castilla_linux.tgz' ${pkgname}.desktop)
md5sums=('e1790a1d1e5dddb222f9c89cff774bb2'
         '19f341eef103764cbe3a4d03a7e6a225')

package() {
	cd "${srcdir}/MalditaCastilla"
	mkdir -p ${pkgdir}/usr/bin
	echo "#!/bin/bash" > ${pkgdir}/usr/bin/${pkgname}
	echo "cd /opt/${pkgname} && ./runner" >> ${pkgdir}/usr/bin/${pkgname}
	chmod 755 ${pkgdir}/usr/bin/${pkgname}
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp * -r ${pkgdir}/opt/${pkgname}
	chmod -R 655 ${pkgdir}/opt/${pkgname}/
	mkdir -p ${pkgdir}/usr/share/icons
	mkdir -p ${pkgdir}/usr/share/applications/
	install -m 644 "${srcdir}/${pkgname}.desktop"  ${pkgdir}/usr/share/applications
}

