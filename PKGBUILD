# Maintainer: Douglas Iuri Medeiros Cabral <diurimc at gmail dot com>
pkgname=forticlient-vpn
pkgver=6.4.0.0851
pkgrel=8
pkgdesc="Build through the official package of FortiClient VPN"
arch=("x86_64")
url="https://forticlient.com/"
license=('custom:fortinet')
provides=('fortivpn' 'FortiClient')
source=("https://filestore.fortinet.com/forticlient/downloads/FortiClientFullVPNInstaller_${pkgver}.deb")
sha256sums=('d229a2f3f13378244058b5b678d25976ba85e5d4c1b247ed2c3c242f6604ed2b')


package() {

	bsdtar -xf data.tar.xz -C "$pkgdir/"

	install -Dm644  "${pkgdir}/lib/systemd/system/forticlient-scheduler.service" "${pkgdir}/usr/lib/systemd/system/forticlient-scheduler.service"

	rm -rf "${pkgdir}/lib"

	# Install license
    	install -Dm 644 "${pkgdir}/usr/share/doc/forticlient/copyright" "${pkgdir}/usr/share/licenses/fortinet/LICENSE"
	
	# Symbolic binaries which are located in /opt
	mkdir -p ${pkgdir}/usr/bin
	ln -sf '/opt/forticlient/fortivpn' "${pkgdir}/usr/bin/fortivpn"
	ln -sf '/opt/forticlient/gui/FortiClient-linux-x64/FortiClient' "${pkgdir}/usr/bin/FortiClient"

}

