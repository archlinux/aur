# Maintainer: Cabel <mxzcabel at proton dot me>
# Contributor: metiis <aur at metiis dot com>
# Contributor: Julio Gutierrez <bubuntux at gmail dot com>
# Contributor: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.17.0
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
sha256sums_x86_64=('d12c830f9e4fe949942a00fd874fdd3e426d5694478feae5482c9f53065ebbf1')
sha256sums_i686=('1e44484bfc3f2fb4721453b51071a85206c50b7bfdfdbf01e30029a7204e27e2')
sha256sums_armv7h=('e4aad5a5b8827108a22afb0dbdf7764e59f9deb59ae32008412b760b20182fe0')
sha256sums_aarch64=('87f1ed43252e56415b4340f5b4f4fea1f7663a0b6b0b036f2d9c216c10368965')

# There is also ArmEABI architecture for android devices available. Download with:
# https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_3.17.0_armel.deb

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
    echo "g nordvpn - -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
