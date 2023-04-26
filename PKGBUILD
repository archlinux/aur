# Maintainer: Cabel <mxzcabel at proton dot me>
# Contributor: metiis <aur at metiis dot com>
# Contributor: Julio Gutierrez <bubuntux at gmail dot com>
# Contributor: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.16.2
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://nordvpn.com/download/linux/"
license=('GPL3')
depends=('libxml2')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-bin.install
source_x86_64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_amd64.deb")
source_i686=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_i386.deb")
source_armv7h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_armhf.deb")
source_aarch64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_arm64.deb")
sha256sums_x86_64=('e9a02c949db1c23fa4845e8738cb6417489c96b53384157ae31ac782ce4d736b')
sha256sums_i686=('75c80e91ae7bf3fa427efa163ce23ac2e15f4d406074ebc97255eb703a880740')
sha256sums_armv7h=('4d7f9da0131eca04dc525be702b16eefa74e51dd6a1f54409d9ffcdb2a0ef88b')
sha256sums_aarch64=('ffa2150ead5b728c6dbe3f149cff4ad7ec84deb5bf311e60daa8f89b25f30bb4')

# ArmEABI architecture for android devices
# https://repo.nordvpn.com/deb/nordpvn/debian/pool/main/nordvpn_${pkgver//_/-}_armel.deb
# b12b196d9d4c4a2becc59660f57ef62216d75c2b

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
    echo "g nordvpn - -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
