# Maintainer: metiis <aur at metiis dot com>
# Maintainer: bubuntux
# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=2.2.0_2
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('net-tools' 'libxslt' 'iptables' 'procps')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
source=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_amd64.deb")
sha256sums=('33f1a216d1e8b62aa064b5f201d343a9d8172771c63f0224f6946c7f939e76a8')

package() {
    bsdtar -O -xf "nordvpn_${pkgver//_/-}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/usr/sbin"

    mkdir -p "${pkgdir}/usr/lib/systemd/system/"
    mv "${pkgdir}/etc/systemd/system/nordvpnd.socket" "${pkgdir}/usr/lib/systemd/system/"
    mv "${pkgdir}/etc/systemd/system/nordvpnd.service" "${pkgdir}/usr/lib/systemd/system/"
    rm -r "${pkgdir}/etc"
}
