# Maintainer: Dawid Potocki <archlinux a dawidpotocki , com>

pkgname=packettracer7
pkgver=7.3.1
pkgrel=1
pkgdesc="Network design and emulation software for Cisco's Networking Academy instructors and students (version 7.x)"
arch=('x86_64')
depends=('qt5-webengine')
url="https://www.netacad.com/courses/packet-tracer"
license=('custom')

source=('local://PacketTracer_731_amd64.deb')
sha256sums=("c39802d15dd61d00ba27fb8c116da45fd8562ab4b49996555ad66b88deace27f")

package() {
	tar xf data.tar.xz -C "${pkgdir}"
	chown root:root -R "${pkgdir}"
	chmod -R g-w "${pkgdir}"

	mv "${pkgdir}/opt/pt/" "${pkgdir}/opt/packettracer7/"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/packettracer7/packettracer" "${pkgdir}/usr/bin/packettracer7"

	sed 's/\/opt\/pt/\/opt\/packettracer7/' -i "${pkgdir}/opt/packettracer7/linguist"
	sed 's/\/opt\/pt/\/opt\/packettracer7/' -i "${pkgdir}/opt/packettracer7/packettracer"
	sed 's/\/opt\/pt/\/opt\/packettracer7/' -i "${pkgdir}/opt/packettracer7/bin/Cisco-PacketTracer.desktop"
	sed 's/\/opt\/pt/\/opt\/packettracer7/' -i "${pkgdir}/usr/share/applications/cisco-pt7.desktop"
	sed 's/\/opt\/pt/\/opt\/packettracer7/' -i "${pkgdir}/usr/share/applications/cisco-ptsa7.desktop"

	echo "Categories=Application;Network;" >> "${pkgdir}/usr/share/applications/cisco-pt7.desktop"
	echo "Categories=Application;Network;" >> "${pkgdir}/usr/share/applications/cisco-ptsa7.desktop"

	install -D -m644 "${pkgdir}/opt/packettracer7/saves/Switch/IE_2000/upgrade_downgrade_license_on_ie2000.pkt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/opt/packettracer7/help/default/copyrights.htm" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
