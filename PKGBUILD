# Maintainer: Alfonso Saaverda "Son Link" <sonlink.dourden@gmail.com>

pkgname=verminian-trap
pkgver=1.1
pkgrel=3
pkgdesc="Your space pod has been forced to land on a planet infested with giant insects from Verminest. Fight with your companions and survive the incoming waves of enemy bugs for as long as you can"
arch=('i686' 'x86_64')
url=('http://www.locomalito.com/verminian_trap.php')
license=('CCPL')
depends=('openal' 'openssl')
if [ "$CARCH" = "x86_64" ]; then
	depends+=('lib32-zlib' 'lib32-openssl' 'lib32-openal' 'lib32-mesa')
fi
source=('http://www.locomalito.com/juegos/Verminian_Trap_1_1_linux.zip'
	${pkgname}.png ${pkgname}.desktop)
md5sums=('367ffb11c878628b0e8e04e77d1b1580'
         '81939813f5cbf9c82c9c88abe03a489d'
         '03a55d9b815448c62d428f5393d4bc84')

package() {
	cd "${srcdir}/verminian_trap_1_1"
	mkdir -p ${pkgdir}/usr/bin
	echo "#!/bin/bash" > $pkgdir/usr/bin/$pkgname
	echo "cd /opt/$pkgname/ && ./runner" >> $pkgdir/usr/bin/$pkgname
	chmod 755 $pkgdir/usr/bin/$pkgname
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp * -r ${pkgdir}/opt/${pkgname}
	chmod -R 655  ${pkgdir}/opt/${pkgname}/runner
	mkdir -p ${pkgdir}/usr/share/icons
	mkdir -p ${pkgdir}/usr/share/applications/
	install -m 644 "${srcdir}/${pkgname}.png"  ${pkgdir}/usr/share/icons
	install -m 644 "${srcdir}/${pkgname}.desktop"  ${pkgdir}/usr/share/applications
}

