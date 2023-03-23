# Maintainer: Cabel <auravenbells at duck dot com>
# Contributor: metiis <aur at metiis dot com>
# Contributor: Julio Gutierrez <bubuntux at gmail dot com>
# Contributor: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.15.5
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
sha256sums_x86_64=('ec8beda568b054568e73dff63731bd98019a58078165734f76a0ae99db256b02')
sha256sums_i686=('673a767c5b4e43a0ebdca8f25963d66a70c8a4d0e6fbaee002a703d41866d133')
sha256sums_armv7h=('ddce63038a342f11199faabb577a24dcc95ab216d8dadb00575be61ec46200eb')
sha256sums_aarch64=('d1c3d1720bf0c04b4b037acc0ca1cce5dfbef5cc778e3548d113906dd3280906')

# Armeabi architeture for android devices
# source_armeabi=("https://repo.nordvpn.com/deb/nordpvn/debian/pool/main/nordvpn_${pkgver//_/-}_armel.deb")
# sha256sums_armeabi=('de39b9bc453212f0011bcdda214462403becddf5f3c3ae842b4a05f93deda71c')

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
    
    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
    echo "g nordvpn - -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
