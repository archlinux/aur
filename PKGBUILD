# Maintainer: metiis <aur at metiis dot com>
pkgname=nordvpn-bin
pkgver=2.2.0_0
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('net-tools' 'libxslt' 'iptables' 'procps')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
source=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_amd64.deb")
sha256sums=('d02661dd3f28501210b67d91a571d439146d4d2be9e1d3469f3582b067bf956c')

package() {
    bsdtar -O -xf "nordvpn_${pkgver//_/-}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/usr/sbin"

    mkdir -p "${pkgdir}/usr/lib/systemd/system/"
    mv "${pkgdir}/etc/systemd/system/nordvpnd.socket" "${pkgdir}/usr/lib/systemd/system/"
    mv "${pkgdir}/etc/systemd/system/nordvpnd.service" "${pkgdir}/usr/lib/systemd/system/"
    rm -r "${pkgdir}/etc"
}
