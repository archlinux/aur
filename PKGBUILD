# Maintainer: Douglas Iuri Medeiros Cabral <douglasimcabral at zohomail dot com>
pkgname=forticlient-vpn
pkgver=7.0.7.0246
pkgrel=1
pkgdesc="Build through the official package of FortiClient VPN only"
arch=("x86_64")
url="https://www.fortinet.com/support/product-downloads"
license=('custom:fortinet')
depends=('systemd' 'nss' 'gtk3' 'libxss' 'polkit' 'openssl' 'libnotify' 'org.freedesktop.secrets' 'libappindicator-gtk2' 'gzip')
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
source=("https://filestore.fortinet.com/forticlient/forticlient_vpn_${pkgver}_amd64.deb")
sha256sums=('482f245df302417ab19b6501525acae6c62a022eec80baf5ad285a0fb1f5323e')


package() {

	bsdtar -xf data.tar.xz -C "$pkgdir/"

	install -Dm644  "${pkgdir}/lib/systemd/system/forticlient.service" "${pkgdir}/usr/lib/systemd/system/forticlient.service"

	rm -rf "${pkgdir}/lib"

	# Install license
	install -Dm 644 "${pkgdir}/usr/share/doc/forticlient/copyright" "${pkgdir}/usr/share/licenses/fortinet/LICENSE"
	
	# Symbolic link to fortivpn CLI
	mkdir -p ${pkgdir}/usr/bin
	ln -sf '/opt/forticlient/fortivpn' "${pkgdir}/usr/bin/fortivpn"

}

