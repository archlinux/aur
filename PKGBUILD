# Maintainer: metiis <aur at metiis dot com>
# Maintainer: bubuntux
# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=2.2.0_3
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('net-tools' 'libxslt' 'iptables' 'procps')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
source=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_amd64.deb")
sha256sums=('84fbb3cf9c4c73f3158987e51ea7e9a73bac2ec4e0bafaecec70997bdee07763')

package() {
    bsdtar -O -xf "nordvpn_${pkgver//_/-}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/usr/sbin"

    mkdir -p "${pkgdir}/usr/lib/systemd/system/"
    mv "${pkgdir}/etc/systemd/system/nordvpnd.socket" "${pkgdir}/usr/lib/systemd/system/"
    mv "${pkgdir}/etc/systemd/system/nordvpnd.service" "${pkgdir}/usr/lib/systemd/system/"
    rm -r "${pkgdir}/etc"
}
