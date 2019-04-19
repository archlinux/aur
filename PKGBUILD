# Maintainer: metiis <aur at metiis dot com>
# Maintainer: bubuntux
# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.0.0_4
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('net-tools' 'libxslt' 'iptables' 'procps' 'iproute2')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-bin.install
source=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_amd64.deb")
sha256sums=('a4a9602a9ecc1b29eb4ef9667993bd68999f42fc1962588951845a797d31ecfa')

package() {
    bsdtar -O -xf "nordvpn_${pkgver//_/-}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnsd" "${pkgdir}/usr/bin"
    mv "${pkgdir}/usr/sbin/nordvpnud" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/usr/sbin"
}
