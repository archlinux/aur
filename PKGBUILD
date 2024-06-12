# Maintainer: Meowser <edward dot o dot holmes at gmail dot com>
# Contributor: Douglas Iuri Medeiros Cabral <douglasimcabral at zohomail dot com>
pkgname=forticlient-vpn
pkgver=7.4.0.1636
pkgrel=1
pkgdesc="Build through the official package of FortiClient VPN only"
arch=("x86_64")
url="https://www.fortinet.com/support/product-downloads"
license=('custom:fortinet')
#depends=('systemd' 'nss' 'gtk3' 'libxss' 'polkit' 'openssl' 'libnotify' 'org.freedesktop.secrets' 'libappindicator-gtk2' 'gzip' 'iptables')
depends=('alsa-lib' 'gtk2' 'libsecret' 'nss' 'gtk3' 'libnotify')
optdepends=(
	'mate-polkit: for polkit authentication for the MATE'
	'polkit-gnome: for polkit authentication for the GNOME'
	'polkit-kde-agent: for polkit authentication for the KDE'
	'deepin-polkit-agent: for polkit authentication for the Deepin'
	'pantheon-polkit-agent: for polkit authentication for the Pantheon'
	'lxqt-policykit: for polkit authentication for the LXQt'
)
provides=('fortivpn' 'FortiClient')
conflicts=('forticlient')
install='forticlient-vpn.install'
source=("https://filestore.fortinet.com/forticlient/forticlient_vpn_${pkgver}_amd64.deb")
sha256sums=('197de51135c093233054107120f55df3720b01a6879eef15ec2fc84f9217b62b')


package() {

	bsdtar -xf data.tar.xz -C "$pkgdir/"

	install -Dm644  "${pkgdir}/lib/systemd/system/forticlient.service" "${pkgdir}/usr/lib/systemd/system/forticlient.service"

	mkdir -p ${pkgdir}/var/lib/forticlient
	rm -rf "${pkgdir}/lib"

	# Install license
	install -Dm 644 "${pkgdir}/usr/share/doc/forticlient/copyright" "${pkgdir}/usr/share/licenses/fortinet/LICENSE"
	
	# Symbolic link to fortivpn CLI
	mkdir -p ${pkgdir}/usr/bin
	ln -sf '/opt/forticlient/fortivpn' "${pkgdir}/usr/bin/fortivpn"
	
}

