# Maintainer: Douglas Iuri Medeiros Cabral <douglasimcabral at zohomail dot com>
pkgname=forticlient-vpn
pkgver=7.0.0.0018
pkgrel=2
pkgdesc="Build through the official package of FortiClient VPN"
arch=("x86_64")
url="https://www.fortinet.com/support/product-downloads"
license=('custom:fortinet')
depends=('nss' 'gtk3' 'libxss' 'polkit' 'openssl' 'libnotify' 'org.freedesktop.secrets' 'libappindicator-gtk2')
optdepends=(
	'mate-polkit: for polkit authentication for the MATE'
	'polkit-gnome: for polkit authentication for the GNOME'
	'polkit-kde-agent: for polkit authentication for the KDE'
	'deepin-polkit-agent: for polkit authentication for the Deepin'
	'pantheon-polkit-agent: for polkit authentication for the Pantheon'
	'lxqt-policykit: for polkit authentication for the LXQt'
)
provides=('fortivpn' 'FortiClient')
install='forticlient-vpn.install'
source=("https://filestore.fortinet.com/forticlient/downloads/forticlient_vpn_${pkgver}_amd64.deb")
sha256sums=('82e5817048a60ff95d2e88b4a95512f9f0035fa37240ce57580c203b5a8a79c9')


package() {

	bsdtar -xf data.tar.xz -C "$pkgdir/"

	install -Dm644  "${pkgdir}/lib/systemd/system/forticlient-scheduler.service" "${pkgdir}/usr/lib/systemd/system/forticlient-scheduler.service"

	rm -rf "${pkgdir}/lib"

	# Install license
    	install -Dm 644 "${pkgdir}/usr/share/doc/forticlient/copyright" "${pkgdir}/usr/share/licenses/fortinet/LICENSE"
	
	# Symbolic binaries which are located in /opt
	mkdir -p ${pkgdir}/usr/bin
	ln -sf '/opt/forticlient/fortivpn' "${pkgdir}/usr/bin/fortivpn"
	ln -sf '/opt/forticlient/gui/FortiClient-linux-x64/FortiClient' "${pkgdir}/usr/bin/forticlient"

	# Symbolic launchers
	mkdir -p ${pkgdir}/etc/xdg/autostart
	ln -sf '/opt/forticlient/Fortitray.desktop' "${pkgdir}/etc/xdg/autostart/Fortitray.desktop"
	ln -sf '/opt/forticlient/Fortivpn.desktop' "${pkgdir}/etc/xdg/autostart/Fortivpn.desktop"

}

