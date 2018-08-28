# Maintainer: coco
# Co-Maintainer: dramm
# Contributor: thatgeek
# Contributor: TorGuard Support <support@torguard.com>
pkgname=torguard
pkgver=3.88.0
pkgrel=1
pkgdesc="TorGuard VPN Software
 Stay private online with TorGuard's anonymous VPN software and connect to 37+ countries worldwide."
arch=('x86_64')
url="www.torguard.com"
depends=('iproute2')
license=(custom)
source=("https://updates.torguard.biz/Software/Linux/torguard-v3.88.0-amd64-arch.tar.gz")
md5sums=('a2e83a90333de540f426cf59577b4eed')
install=.INSTALL

package() {
	tar -xf "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/torguard-v${pkgver}-amd64-arch.tar"
        cp -r "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/opt" "${pkgdir}/" -R
        cp -r "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/usr" "${pkgdir}/" -R
        cp -r "$srcdir"/*/* "$pkgdir"
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
}
