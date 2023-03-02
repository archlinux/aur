# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Crowdsec Team <debian@crowdsec.net>

pkgname=(crowdsec-firewall-bouncer-iptables-bin crowdsec-firewall-bouncer-nftables-bin)

pkgbase=crowdsec-firewall-bouncer-bin
_pkgname=(crowdsec-firewall-bouncer)

pkgver=0.0.25
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://crowdsec.net"
license=('MIT')
source=(crowdsec-firewall-bouncer-{nftables,iptables}-bin.install)
depends=(
	'crowdsec'
)
backup=('etc/crowdsec/bouncers/crowdsec-firewall-bouncer.yaml')

source_x86_64=(https://packagecloud.io/crowdsec/crowdsec/ubuntu/pool/jammy/main/c/crowdsec/${_pkgname}-nftables_${pkgver}_amd64.deb)
source_aarch64=(https://packagecloud.io/crowdsec/crowdsec/ubuntu/pool/jammy/main/c/crowdsec/${_pkgname}-nftables_${pkgver}_arm64.deb)


prepare() {
	bsdtar -xf ${srcdir}/data.tar.zst 
}

package_crowdsec-firewall-bouncer-iptables-bin() {	

	depends=('ipset' 'iptables')
	pkgdesc="Firewall bouncer for Crowdsec (iptables+ipset) - binary version"
	install=crowdsec-firewall-bouncer-iptables-bin.install
	mkdir -p ${pkgdir}{/etc,/usr,/usr/bin}
	cp -r ${srcdir}/etc ${pkgdir}
	cp -r ${srcdir}/usr/share ${pkgdir}/usr
	cp -r ${srcdir}/usr/sbin/* ${pkgdir}/usr/bin


}


package_crowdsec-firewall-bouncer-nftables-bin() {
	
	depdends=('nftables')
	pkgdesc="Firewall bouncer for Crowdsec (nftables) - binary version"
	install=crowdsec-firewall-bouncer-nftables-bin.install
	mkdir -p ${pkgdir}{/etc,/usr,/usr/bin}
	cp -r ${srcdir}/etc ${pkgdir}
	cp -r ${srcdir}/usr/share ${pkgdir}/usr
	cp -r ${srcdir}/usr/sbin/* ${pkgdir}/usr/bin


}







sha256sums=('c83017ae6b8174647817c82a8e3a7855420811f4395224898c62df89aeaf0ac0'
            '8cd0afbabc5c97cc4181d451bf06b6bcc709b721e0ec82550cc9f99532acb784')
sha256sums_x86_64=('150666621d61e3bad05a28da9fda17a96743805e5392b278b0f3ecb8fe441382')
sha256sums_aarch64=('bfeb8f778d7d01dbdaedaad6b13d35169e4d7335dc2782de153195d402e86ac3')
