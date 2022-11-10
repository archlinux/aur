# Maintainer: Douglas Iuri Medeiros Cabral <douglasimcabral at zohomail dot com>
pkgname=forticlient-vpn
pkgver=7.0.7.0246
pkgrel=2
pkgdesc="Build through the official package of FortiClient VPN"
arch=("x86_64")
url="https://www.fortinet.com/support/product-downloads"
license=('custom:fortinet')
depends=('systemd' 'gzip' 'nss' 'gtk3' 'libxss' 'polkit' 'openssl' 'libnotify' 'org.freedesktop.secrets' 'libappindicator-gtk2' 'cups')
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
source=("https://repo.fortinet.com/repo/7.0/ubuntu/pool/multiverse/forticlient/forticlient_${pkgver}_amd64.deb")
sha256sums=('634d27f412764d74a44b63c63258fcf63206417cfb97570934ac8ab4b52f53a1')


package() {

	bsdtar -xf data.tar.xz -C "$pkgdir/"

	install -Dm644  "${pkgdir}/lib/systemd/system/forticlient.service" "${pkgdir}/usr/lib/systemd/system/forticlient.service"

	# Install license
    install -Dm 644 "${pkgdir}/usr/share/doc/forticlient/copyright" "${pkgdir}/usr/share/licenses/fortinet/LICENSE"
	
	# Symbolic binaries which are located in /opt
	mkdir -p ${pkgdir}/usr/bin
	ln -sf '/opt/forticlient/fortivpn' "${pkgdir}/usr/bin/fortivpn"
	ln -sf '/opt/forticlient/forticlient-cli' "${pkgdir}/usr/bin/forticlient"

	# Symbolic launchers
	mkdir -p ${pkgdir}/etc/xdg/autostart
	ln -sf '/opt/forticlient/Fortitray.desktop' "${pkgdir}/etc/xdg/autostart/Fortitray.desktop"
}

