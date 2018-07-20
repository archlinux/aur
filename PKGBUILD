# Maintainer: Jimmy Stelzer <jimmy dot stelzer at gmail dot com>
pkgname=uniflash
pkgver=4.4.0.1922
pkgrel=1
pkgdesc="Universal Flash Programmer for Texas Instruments devices. Provides a single interface for programming Flash memory and executing Flash based operations on supported targets."
arch=('i686' 'x86_64')
url="http://processors.wiki.ti.com/index.php/Category:CCS_UniFlash"
license=('custom:TECHNOLOGY SOFTWARE PUBLICLY AVAILABLE by Texas Instruments Incorporated')
depends=('libudev0-shim')
source=(${pkgname}_sl.$pkgver.run::http://software-dl.ti.com/ccs/esd/uniflash/${pkgname}_sl.$pkgver.run )
noextract=("${pkgname}_sl.$pkgver.run" )
options=(!strip)
md5sums=('48cce7181c06d37c5015b9f2dd0521d2')
sha256sums=('8539b38be78e08bdeff7dccd0aa2a448a676e1ac1da0b4215817b92f0bc8b052')
DLAGENTS=('http::/usr/bin/curl -fLC - --cookie nada -o %o %u')
prepare() {
	cd "$srcdir"
	msg "If you continue you will accept the license, more information at http://processors.wiki.ti.com/index.php/Category:CCS_UniFlash."
	chmod +x ${pkgname}_sl.$pkgver.run
}
build() {
	cd "$srcdir"

}

package() {
	cd "$srcdir"
	./${pkgname}_sl.$pkgver.run --unattendedmodeui none --mode unattended --prefix $pkgdir/opt/ti/uniflash
	cd "$pkgdir/opt/ti/uniflash"
	
	sed -s "s|$pkgdir||" -i UniFlash.desktop
	install -d "$pkgdir/usr/share/applications"
	install -m 644 "$pkgdir/opt/ti/uniflash/UniFlash.desktop" "$pkgdir/usr/share/applications/UniFlash.desktop"
}
