# Maintainer: Samim <psamim at gmail dot com>

pkgname=nordvpnteams-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="NordVPNTeams CLI tool for Linux"
arch=('x86_64')
url="https://nordvpnteams.com/download/linux/"
license=('custom')
depends=('libxslt' 'iptables' 'procps' 'iproute2' 'ipset' 'ca-certificates')
install="post.install"
provides=('nordvpnteams')
source_x86_64=("https://downloads.nordlayer.com/linux/latest/debian/pool/main/nordvpnteams_${pkgver//_/-}_amd64.deb")
sha256sums_x86_64=('213a796d3069af2f15456f2a9402f290e883855a6f7ee7f1177f212eacdafae5')

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
    mv "${pkgdir}/usr/sbin/nordvpnteamsd" "${pkgdir}/usr/bin"
    mv "${pkgdir}/usr/sbin/nordvpnteams-openvpn" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/usr/sbin"
    # rm -r "${pkgdir}/var/run"
}
