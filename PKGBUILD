# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>
# Contributor: z3ntu <WEI16416@spengergasse.at>

pkgname=packettracer
pkgver=7.3.0
pkgrel=2
pkgdesc="Cisco PacketTracer 7.3.0 installation package"
arch=( 'x86_64' )
depends=('openssl-1.0' 'libpng12' 'icu')
options=('!strip' '!emptydirs')
url="https://www.netacad.com/courses/packet-tracer"
install=${pkgname}.install
license=('custom')

source=('local://PacketTracer_730_amd64.deb'
	'packettracer.sh')
sha512sums=('b06275775703791d56618d99fa7daf29a8a5c82dc17b66d12a9b29927f0a97deb082a757c0cdf72c2345ac32449d0506dad35237ac9935db2e86982e115f1ae1'
	    '156579687c5eb63ef2065b28625d9faeee96d2224248c6883a92264f5c0e800c5ab9206ad4c6afebb9dcdbe6b880a9a24caf96044a7c97df743473933fcd2c4d')

package() {

	tar xf data.tar.xz -C "${pkgdir}"

	mv ${pkgdir}/opt/pt/ ${pkgdir}/opt/packettracer/

	mkdir -p "${pkgdir}/usr/bin/"
	ln -s ${pkgdir}/opt/packettracer "${pkgdir}/usr/bin/packettracer"

	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/opt/packettracer/linguist"
	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/opt/packettracer/packettracer"
	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/opt/packettracer/bin/Cisco-PacketTracer.desktop"
	sed 's/\/opt\/pt/\/opt\/packettracer/' -i "${pkgdir}/usr/share/applications/cisco-pt7.desktop"
	rm "${pkgdir}/usr/share/applications/cisco-ptsa7.desktop"
	sed -e "\$aCategories=Application;Network;" -i "${pkgdir}/usr/share/applications/cisco-pt7.desktop"

	install -D -m755 "${srcdir}/packettracer.sh" "${pkgdir}/etc/profile.d/packettracer.sh"

	install -D -m644 "${pkgdir}/opt/packettracer/saves/Switch/IE_2000/upgrade_downgrade_license_on_ie2000.pkt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/opt/packettracer/help/default/copyrights.htm" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	install -D -m644 "${pkgdir}/opt/packettracer/eula730.txt" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"

}
