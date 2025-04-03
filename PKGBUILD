# Maintainer: Meowser <edward dot o dot holmes at gmail dot com>
# Contributor: Douglas Iuri Medeiros Cabral <douglasimcabral at zohomail dot com>
pkgname=forticlient-vpn
pkgver=7.4.3.1736
pkgrel=1
pkgdesc="Build through the official package of FortiClient VPN only"
arch=("x86_64")
url="https://www.fortinet.com/support/product-downloads"
license=('custom:fortinet')
depends=('libgnome-keyring' 'alsa-lib' 'gnome-keyring' 'gtk2' 'gtk3' 'gzip' 'iptables' 'libappindicator-gtk2' 'libnotify' 'libsecret' 'libxss' 'nss' 'openssl' 'org.freedesktop.secrets' 'polkit' 'systemd' 'net-tools')
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
source=("https://filestore.fortinet.com/forticlient/downloads/forticlient_vpn_${pkgver}_amd64.deb")
sha256sums=('45c465ca669d4bc6d0f1d3a93f4eb765b996e05c10f6e8e9e2db2fa6728a541c')


package() {

	bsdtar -xf data.tar.xz -C "$pkgdir/"

	install -Dm644  "${pkgdir}/lib/systemd/system/forticlient.service" "${pkgdir}/usr/lib/systemd/system/forticlient.service"

	mkdir -p "${pkgdir}/var/lib/forticlient"
	rm -rf "${pkgdir}/lib"

	# Install license
	install -Dm 644 "${pkgdir}/usr/share/doc/forticlient/copyright" "${pkgdir}/usr/share/licenses/fortinet/LICENSE"
	
	# Symbolic link to fortivpn CLI
	mkdir -p "${pkgdir}/usr/bin"
	ln -sf '/opt/forticlient/fortivpn' "${pkgdir}/usr/bin/fortivpn"

}

