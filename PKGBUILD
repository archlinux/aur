# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
pkgname=day-of-the-tentacle-hib
pkgver=1.4.1+h20160426
pkgrel=1
pkgdesc="A mind-bending, time travel, cartoon puzzle adventure game. (Humble Bundle)"
arch=('i686' 'x86_64')
url="http://dott.doublefine.com"
license=('unknown')
depends_i686=('mesa')
depends_x86_64=('lib32-mesa')
provides=("${pkgname%-hib}")
conflicts=("${pkgname%-hib}")
install=
source=("hib://DayOfTheTentacle_Linux_NoSteam_v${pkgver%+h*}.tar.gz"
	"${pkgname}.png::https://humblebundle-a.akamaihd.net/misc/files/hashed/e4deb24a1de8e77c6227d86a23024460345f73cf.png"
	"local://${pkgname}.desktop")
md5sums=('667b2a8a082702832242321515e55e70'
         '194ec818316a9d1ce44b79c39844627e'
         'b5f9c9bc9380fe2f263b6ed7bced8faf')
DLAGENTS+=('hib::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf.; exit 1')
PKGEXT=.pkg.tar

package() {
	cd "$srcdir"
	install -Dm755 Dott "${pkgdir}/opt/${pkgname%-hib}/Dott"
	install -Dm644 controllerdef.txt \
		"${pkgdir}/opt/${pkgname%-hib}/controllerdef.txt"
	install -Dm644 tenta.cle "${pkgdir}/opt/${pkgname%-hib}/tenta.cle"
	for i in lib/*; do
		install -Dm644 $i "${pkgdir}/opt/${pkgname%-hib}/$i"
	done
	install -Dm644 readme.txt \
		"${pkgdir}/usr/share/doc/${pkgname}/readme.txt"
	install -Dm644 ${pkgname}.desktop \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 ${pkgname}.png \
		"${pkgdir}/usr/share/pixmaps/${pkgname%-hib}.png"
	
	mkdir -p "${pkgdir}/usr/bin"
	ln -s /opt/${pkgname%-hib}/Dott ${pkgdir}/usr/bin/Dott
}
