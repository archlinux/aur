# Maintainer: metiis <aur at metiis dot com>
pkgname=nordvpn-bin
pkgver=2.1.0_5
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('net-tools' 'libxslt' 'iptables' 'procps')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
source=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_amd64.deb")
sha256sums=('684ab467fed5f84d3200a97d92d2f796fe9bb19cecc1f15900a1f88d819bb08b')

package() {
    bsdtar -O -xf "nordvpn_${pkgver//_/-}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/usr/sbin"

    mkdir -p "${pkgdir}/usr/lib/systemd/system/"
    mv "${pkgdir}/etc/systemd/system/nordvpnd.socket" "${pkgdir}/usr/lib/systemd/system/"
    mv "${pkgdir}/etc/systemd/system/nordvpnd.service" "${pkgdir}/usr/lib/systemd/system/"
    rm -r "${pkgdir}/etc"
}
