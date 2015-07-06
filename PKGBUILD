# Maintainer: Alfonso Saaverda "Son Link" <sonlink.dourden@gmail.com>

pkgname=donkey-me
pkgver=1.0
pkgrel=2
pkgdesc="A Donkey Kong game whit some grafics themes ispired on clasicals movies like Star Wars, Indiana Jones, Alien, etc"
arch=('i686' 'x86_64')
url=('http://www.bruneras.com/games_donkeyme.php')
license=('FREE')
depends=('openssl' 'openal')
if [ "$CARCH" = "x86_64" ]; then
	depends+=('lib32-openssl' 'lib32-openal' )
fi
arch=('x86_64' 'i686')
source=('https://dl.dropboxusercontent.com/u/58286032/aur/donkeyme.zip'
	${pkgname}.png ${pkgname}.desktop)
md5sums=('10a72ea8500088f956ddbafe54586024'
         '23360dd4e532bb12ba66d9d42185d7b3'
         '1c4a5d81d3419308de06ffb4a0d6e99f')

package() {
	cd ${srcdir}/donkeyme
	mkdir -p ${pkgdir}/usr/bin
	echo "#!/bin/bash" > $pkgdir/usr/bin/$pkgname
	echo "cd /opt/donkeyme/ && ./runner" >> $pkgdir/usr/bin/$pkgname
	chmod 755 $pkgdir/usr/bin/$pkgname
	mkdir -p ${pkgdir}/opt/donkeyme/assets/
	cp * -r ${pkgdir}/opt/donkeyme/
	find "$pkgdir"/opt -type f -exec chmod 644 "{}" \;
	find "$pkgdir"/opt -type d -exec chmod 755 "{}" \;
	chmod a+x ${pkgdir}/opt/donkeyme/runner
	mkdir -p ${pkgdir}/usr/share/icons
	mkdir -p ${pkgdir}/usr/share/applications/
	install -m 644 "${srcdir}/${pkgname}.png"  ${pkgdir}/usr/share/icons
	install -m 644 "${srcdir}/${pkgname}.desktop"  ${pkgdir}/usr/share/applications
}
