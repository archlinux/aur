# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>
# Contributor: z3ntu <WEI16416@spengergasse.at>

pkgname=packettracer
pkgver=7.3.0
pkgrel=1
pkgdesc="Cisco PacketTracer 7.3.0 installation package"
arch=( 'x86_64' )
depends=('openssl-1.0' 'libpng12' 'icu')
install=${pkgname}.install
options=('!strip' '!emptydirs')
url="https://www.netacad.com/courses/packet-tracer"
license=('custom')

source=('local://PacketTracer_730_amd64.deb')
sha512sums=('b06275775703791d56618d99fa7daf29a8a5c82dc17b66d12a9b29927f0a97deb082a757c0cdf72c2345ac32449d0506dad35237ac9935db2e86982e115f1ae1')

package() {

	tar xf data.tar.xz -C "${pkgdir}"

	mv ${pkgdir}/opt/pt/ ${pkgdir}/opt/packettracer/

	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/opt/packettracer/linguist"
	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/opt/packettracer/packettracer"
	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/opt/packettracer/bin/Cisco-PacketTracer.desktop"
	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/usr/share/applications/cisco-pt7.desktop"
	rm "${pkgdir}/usr/share/applications/cisco-ptsa7.desktop"
	sed -e "\$aCategories=Application;Network;" -i "${pkgdir}/usr/share/applications/cisco-pt7.desktop"

	install -D -m644 "${pkgdir}/opt/packettracer/saves/Switch/IE_2000/upgrade_downgrade_license_on_ie2000.pkt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/opt/packettracer/help/default/copyrights.htm" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	install -D -m644 "${pkgdir}/opt/packettracer/eula730.txt" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"

}
