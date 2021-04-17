# Maintainer: Douglas Iuri Medeiros Cabral <douglasimc at outlook dot com>
pkgname=forticlient-vpn
pkgver=6.4.3.0959
pkgrel=1
pkgdesc="Build through the official package of FortiClient VPN"
arch=("x86_64")
url="https://forticlient.com/"
license=('custom:fortinet')
depends=('nss' 'gtk3' 'libxss' 'polkit' 'openssl' 'libnotify' 'org.freedesktop.secrets')
optdepends=(
	'libappindicator-gtk2: for show trayicon'
	'mate-polkit: for polkit authentication'
	'polkit-gnome: for polkit authentication'
	'polkit-kde-agent: for polkit authentication'
	'deepin-polkit-agent: for polkit authentication'
	'pantheon-polkit-agent: for polkit authentication'
	'lxqt-policykit: for polkit authentication'
)
provides=('fortivpn' 'FortiClient')
install='forticlient-vpn.install'
source=("https://fortinetweb.s3.amazonaws.com/forticlient/downloads/FortiClientFullVPNInstaller_${pkgver}_amd64.deb")
sha256sums=('728a416b93ff4944b9c1d5974ac29eefad2d5fca33efd48a2967db23fd7450ea')


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

