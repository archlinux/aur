# Maintainer: Cabel <mxzcabel at tuta dot com>
# Contributor: metiis <aur at metiis dot com>
# Contributor: Julio Gutierrez <bubuntux at gmail dot com>
# Contributor: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=5.0.0
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'armeabi')
url="https://nordvpn.com/download/linux/"
license=('GPL3')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-bin.install
source_x86_64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_amd64.deb")
source_i686=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_i386.deb")
source_armv7h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_armhf.deb")
source_aarch64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_arm64.deb")
source_armeabi=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${pkgver//_/-}_armel.deb")
sha256sums_x86_64=('17bff9580006697dc8277bffa6ca7d732586b3b927d973a209237643acde4406')
sha256sums_i686=('ef065c6e0809e26ce00fe24ff2f5b44be99ab7b33d2e886abbfbe44fba8db451')
sha256sums_armv7h=('a02bcac17a9cf79c003d2e3cd30dbfde18aea04055323714faae76b3b45868ce')
sha256sums_aarch64=('0afb38fd5c01fdafab1f9abab5ec97e5ec44ab4b03f6468e8a9b0fa929ac23be')
sha256sums_armeabi=('22d7e97a6da8cda68223a6913a76c8dbe8944ab901182b9c31df8573d33d7151')

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
    chmod 750 "${pkgdir}/var/lib/nordvpn/"
    chmod 750 "${pkgdir}/var/lib/nordvpn/data/"
    echo "g nordvpn - -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
