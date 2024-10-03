# Maintainer: Cabel <mxzcabel at proton dot me>
# Contributor: metiis <aur at metiis dot com>
# Contributor: Julio Gutierrez <bubuntux at gmail dot com>
# Contributor: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.19.0
pkgrel=2
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'armeabi')
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
source_armeabi=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_armel.deb")
sha256sums_x86_64=('bec97eba77ae0c4b949a5bd19cc20b53046e46445756d9396bb39c43db586e96')
sha256sums_i686=('0f973ef8ad06457c31ee4b8bf0fc57fd51f6d62ffc417f749c15bb4327f104a8')
sha256sums_armv7h=('901014d059867339487a5081e2196c5ef889fb9c838564ae72f09e166228149c')
sha256sums_aarch64=('ca940aca679c387ee15ca06449407b43efb444feee2c64ff88f7b61449136a91')
sha256sums_armeabi=('ecc8f3e9eb72d29e22d75368aff1221b9f0093bb768eeeda3c4512d1c2517b2e')

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
    echo "g nordvpn - -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
