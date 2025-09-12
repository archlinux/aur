# Maintainer: Cabel <mxzcabel at tuta dot com>
# Contributor: metiis <aur at metiis dot com>
# Contributor: Julio Gutierrez <bubuntux at gmail dot com>
# Contributor: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=4.1.0
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
sha256sums_x86_64=('90247034965215c893cb782d917b33b3a21b79d47ed443cbf619d3b64ff3f314')
sha256sums_i686=('2cbc50f3f1c4fb34af161012b76155a4de9ff13d33205e8b2bd7a14eb1e7879c')
sha256sums_armv7h=('b1c9669f3c2af66f37def0fb595fac4be52ab49c74d11687cf4a4ec35c0dbd0b')
sha256sums_aarch64=('d8eae88aa5ece6338f9103434a23bd5fac15e2fdb1e5b6a01e38e8f104877acf')
sha256sums_armeabi=('2fe698e576f3d93bd5838f9595c1c55a8ea09f3f18bcdbc69f1005f2ee764f26')

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
    echo "g nordvpn - -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
