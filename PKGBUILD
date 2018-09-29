# Maintainer: coco
# Co-Maintainer: dramm <dramm at archlinux dot email>
# Contributor: thatgeek
# Contributor: TorGuard Support <support@torguard.com>
pkgname=torguard
pkgver=3.89.0
pkgrel=1
pkgdesc="TorGuard VPN Software
 Stay private online with TorGuard's anonymous VPN software and connect to 37+ countries worldwide."
arch=('x86_64')
url="https://www.torguard.com"
depends=('iproute2'
		 'qt5-base')
license=(custom)
source=("https://updates.torguard.biz/Software/Linux/torguard-v3.89.0-amd64-arch.tar.gz"
		'torguard.sysusers')
sha256sums=('1a097a9761f59a63f281854e693c6bd0b20d765bd99ce7533a9449e0c6745aec'
			'b1f954c54725794f94009c72e12746f203ce6dd4318a19ad0c10d5d8684cd873')

package() {
	tar -xf "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/torguard-v${pkgver}-amd64-arch.tar"
        cp -r "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/etc" "${pkgdir}/" -R
        cp -r "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/opt" "${pkgdir}/" -R
        cp -r "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/usr" "${pkgdir}/" -R

        find "$pkgdir"/opt/torguard/ -type f -exec chmod 644 {} \;
        find "$pkgdir"/opt/torguard/ -name torguard -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name torguard-wrapper -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name ss-local -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name openvpn_v2_4 -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name openconnect -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name vpnc-script -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name stunnel -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/bin/ -name torguard-startup.desktop -exec chmod 664 {} \;
        find "$pkgdir"/etc/sudoers.d/ -name torguard -exec chmod 440 {} \;
		find "$pkgdir"/etc/sudoers.d/ -type d -exec chmod 750 {} \;

        install -d "$pkgdir"/usr/bin/
        ln -s /opt/torguard/bin/torguard-wrapper "$pkgdir"/usr/bin/torguard

		install -Dm644 ${pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
}
