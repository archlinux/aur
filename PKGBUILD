# Maintainer: Cabel <mxzcabel at tuta dot com>
# Contributor: metiis <aur at metiis dot com>
# Contributor: Julio Gutierrez <bubuntux at gmail dot com>
# Contributor: Martoko <mbastholm at gmail dot com>

#——————————————————————————————————————————————————————————————————————————————
## NOTE ##
### This version requires to logging in on NordVPN again ###
### in order to accept/deny new policies regarding data collection ###
#——————————————————————————————————————————————————————————————————————————————

pkgname=nordvpn-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'armeabi')
url="https://nordvpn.com/download/linux/"
license=('GPL3')
depends=('libxml2-legacy')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-bin.install
source_x86_64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_amd64.deb")
source_i686=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_i386.deb")
source_armv7h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_armhf.deb")
source_aarch64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_arm64.deb")
source_armeabi=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_armel.deb")
sha256sums_x86_64=('7a529110a885af1d938093c9975011b4479bb2fe0f346f5f32ada6ad5f719e0b')
sha256sums_i686=('092a02500ef9b34cd0c244d7f8863cf2659d4140dac731d0260da4e202520665')
sha256sums_armv7h=('fcfe0c090d19ba8e57ff8ca86296a11dbe554654a0b7ec2751e509b5778b4f44')
sha256sums_aarch64=('69ee4bbe4d4ea498f64ea1f80a1cfcab74709f3b2f15df0b1ac9d654de5beba8')
sha256sums_armeabi=('646df9b6806fc1b65a9e210972298760363561a9ce208f632a866a06af5fd8e4')

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
    echo "g nordvpn - -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
