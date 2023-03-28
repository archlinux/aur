# Maintainer: Cabel <auravenbells at duck dot com>
# Contributor: metiis <aur at metiis dot com>
# Contributor: Julio Gutierrez <bubuntux at gmail dot com>
# Contributor: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.16.1
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('libxml2')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-bin.install
source_x86_64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_amd64.deb")
source_i686=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_i386.deb")
source_armv7h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_armhf.deb")
source_aarch64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_arm64.deb")
sha256sums_x86_64=('ae3d50b823b3b6056645e0a7db81c81030322d1ec696c50324ad06665f844573')
sha256sums_i686=('2fabc0bbfa6bcb7f75b1ae059b20aab6d98b7147baf6240df462cb1e675253bf')
sha256sums_armv7h=('b3a7a3f6eb416003a2c7ce541cf92cc410d8fd1567501ed4a8d8208cd13a8ad7')
sha256sums_aarch64=('c0e52f30ee3876f95d5bff3bfeb9080523364a06178924d5ca65c3e5dd16aebe')

# ArmEABI architecture for android devices
# https://repo.nordvpn.com/deb/nordpvn/debian/pool/main/nordvpn_${pkgver//_/-}_armel.deb
# 4730c84447a545a06483dfe67bac3dc9df8025922df2292847e2fe192c7be36b

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
    echo "g nordvpn - -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
