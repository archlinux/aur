# Maintainer: Jingrong Chen <crazyboycjr at gmail dot com>
pkgname=motionpro
_pkgname=${pkgname//-/_}
pkgver=9.3.0
pkgrel=1
pkgdesc="Array Networks, MotionPro VPN, version 9.3.0.274"
arch=('x86_64')
url="https://support.arraynetworks.net/prx/001/http/supportportal.arraynetworks.net/downloads/downloads.html"
license=('none')
depends=()
source=("https://support.arraynetworks.net/prx/001/http/supportportal.arraynetworks.net/downloads/pkg_9_3_0_274/vpn_cmdline_linux64_v1.0.54.zip")

package() {
	install -Dm755 "${srcdir}/array_vpnc" -t "${pkgdir}/usr/share/${pkgname}"
	install -Dm755 "${srcdir}/vpn_cmdline" -t "${pkgdir}/usr/share/${pkgname}"

	mkdir -p "${pkgdir}"/usr/local/bin
	ln -sf "/usr/share/${pkgname}/array_vpnc" "${pkgdir}/usr/local/bin"
	cat <<EOF > vpn_cmdline.sh
#!/bin/bash
cd /usr/share/${pkgname}
exec sudo ./vpn_cmdline \$@
EOF
	install -Dm755 vpn_cmdline.sh "${pkgdir}/usr/local/bin/vpn_cmdline"
	find "${pkgdir}" -type f | xargs chown root:root

	install -Dm644 "${srcdir}/ReadMeFirst" -t "${pkgdir}/usr/share/${pkgname}"
}
md5sums=('846dde47e8a1128538204493c75dc536')
