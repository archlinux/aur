# Maintainer: Cabel <mxzcabel at tuta dot com>
# Contributor: metiis <aur at metiis dot com>
# Contributor: Julio Gutierrez <bubuntux at gmail dot com>
# Contributor: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=4.6.0
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
sha256sums_x86_64=('b7e92f80ace32c96343caf5e83a11dbfdfa8a55aea59497d58c448b870c942e3')
sha256sums_i686=('3555d244b194af8250df254d1717cfe2f21be2966dc9620479de2c37eb0f2220')
sha256sums_armv7h=('70b269e89320a2a49f6dcfb807d401cc25e9f629111e02d355a085b66f973cda')
sha256sums_aarch64=('0c2a29a3e94dda390803e3aca521dd50bdecbd2db2b86a11078f4a48243e3594')
sha256sums_armeabi=('6c049f52d2427aca9b2f02abde5ab7e79f0a143393375462b73e0e5b0e60800f')

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
    echo "g nordvpn - -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
